# Generic name-search lookup against wow.tools.local /dbc/data/<table>/ endpoint.
# Overwrite $table and $name before running. wow.tools.local must already be running.
# table options used by add-category-data: uimap | journalinstance | areapoi
$table = "areapoi"
$name = "Venomfall Deeps"
$build = "12.1.0.68914"
$body = "draw=1&start=0&length=20&search[value]=$name"
$resp = Invoke-WebRequest "http://localhost:5000/dbc/data/$table/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$resp.Content
