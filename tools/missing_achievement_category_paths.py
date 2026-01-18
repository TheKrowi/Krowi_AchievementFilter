from __future__ import annotations

import csv
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple


@dataclass(frozen=True)
class Category:
    id: int
    name: str
    parent: int
    ui_order: int


@dataclass(frozen=True)
class Achievement:
    id: int
    title: str
    category_id: int


def read_categories(path: Path) -> Dict[int, Category]:
    categories: Dict[int, Category] = {}
    with path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            category_id = int(row["ID"])
            categories[category_id] = Category(
                id=category_id,
                name=row["Name_lang"],
                parent=int(row["Parent"]),
                ui_order=int(row["Ui_order"]),
            )
    return categories


def read_achievements(path: Path) -> Dict[int, Achievement]:
    achievements: Dict[int, Achievement] = {}
    with path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            achievement_id = int(row["ID"])
            achievements[achievement_id] = Achievement(
                id=achievement_id,
                title=row.get("Title_lang", "") or "",
                category_id=int(row["Category"]),
            )
    return achievements


_MISSING_ID_RE = re.compile(r"\{\s*(\d+)\s*(?:,|\})")


def read_missing_ids(path: Path) -> List[int]:
    text = path.read_text(encoding="utf-8", errors="replace")
    return [int(m.group(1)) for m in _MISSING_ID_RE.finditer(text)]


def category_path(category_id: int, categories: Dict[int, Category]) -> Tuple[List[str], List[int]]:
    """Returns (names, ids) from root->leaf for the given category_id."""
    names: List[str] = []
    ids: List[int] = []

    visited: set[int] = set()
    current = category_id
    while True:
        if current in visited:
            names.append("<CYCLE>")
            ids.append(current)
            break
        visited.add(current)

        cat = categories.get(current)
        if cat is None:
            names.append("<UNKNOWN CATEGORY>")
            ids.append(current)
            break

        names.append(cat.name)
        ids.append(cat.id)

        if cat.parent == -1:
            break
        current = cat.parent

    names.reverse()
    ids.reverse()
    return names, ids


def unique_preserve_order(items: Iterable[int]) -> List[int]:
    seen: set[int] = set()
    result: List[int] = []
    for x in items:
        if x in seen:
            continue
        seen.add(x)
        result.append(x)
    return result


def main() -> int:
    repo_root = Path(__file__).resolve().parents[1]
    packaging = repo_root / "_Packaging"

    categories_path = packaging / "achievement_category.csv"
    achievements_path = packaging / "achievement(4).csv"
    missing_path = packaging / "MissingAchievements.md"

    categories = read_categories(categories_path)
    achievements = read_achievements(achievements_path)
    missing_ids = read_missing_ids(missing_path)

    missing_unique = unique_preserve_order(missing_ids)

    output_md = packaging / "MissingAchievements_Categories.md"
    output_csv = packaging / "MissingAchievements_Categories.csv"

    rows: List[dict] = []

    for achievement_id in missing_unique:
        ach = achievements.get(achievement_id)
        if ach is None:
            rows.append(
                {
                    "AchievementID": achievement_id,
                    "Title": "<NOT FOUND IN achievement(4).csv>",
                    "CategoryID": "",
                    "CategoryPath": "",
                    "CategoryPathWithIds": "",
                }
            )
            continue

        names, ids = category_path(ach.category_id, categories)
        rows.append(
            {
                "AchievementID": achievement_id,
                "Title": ach.title,
                "CategoryID": ach.category_id,
                "CategoryPath": " > ".join(names),
                "CategoryPathWithIds": " > ".join(f"{n} ({i})" for n, i in zip(names, ids)),
            }
        )

    # Write CSV
    with output_csv.open("w", encoding="utf-8", newline="") as f:
        fieldnames = [
            "AchievementID",
            "Title",
            "CategoryID",
            "CategoryPath",
            "CategoryPathWithIds",
        ]
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

    # Write MD (easy to skim in editor)
    with output_md.open("w", encoding="utf-8", newline="\n") as f:
        f.write("# Missing Achievements: Category Paths\n\n")
        f.write("Generated from:_Packaging/achievement(4).csv + _Packaging/achievement_category.csv + _Packaging/MissingAchievements.md\n\n")
        f.write("Format: `AchievementID` — `Root > ... > Leaf`\n\n")

        for row in rows:
            aid = row["AchievementID"]
            title = row["Title"]
            path = row["CategoryPath"]
            if not path:
                f.write(f"- {aid} — {title}\n")
            else:
                f.write(f"- {aid} — {path}  ({title})\n")

    print(f"Wrote: {output_md}")
    print(f"Wrote: {output_csv}")
    print(f"Missing IDs parsed: {len(missing_ids)} (unique {len(missing_unique)})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
