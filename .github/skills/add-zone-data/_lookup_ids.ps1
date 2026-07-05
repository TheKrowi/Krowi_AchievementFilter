# Overwrite $ids before running. Parent agent uses create_file to set the IDs.
$ids = @()
foreach ($id in $ids) {
    $body = "draw=1&start=0&length=1&search[value]=$id"
    $r = Invoke-RestMethod -Uri "http://localhost:5000/dbc/data/achievement/?build=12.0.7.68275" -Method Post -Body $body -ContentType "application/x-www-form-urlencoded"
    if ($r.data.Count -gt 0) {
        Write-Host "$id => Title: $($r.data[0][1]) | Desc: $($r.data[0][0])"
    } else {
        Write-Host "$id => NOT FOUND"
    }
}
