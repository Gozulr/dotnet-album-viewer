$OutputDir = "output-files"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

1..10 | ForEach-Object {
    $file = Join-Path $OutputDir ("file_{0}.txt" -f $_)
    Get-Date | Out-File -FilePath $file -Encoding utf8
}

Write-Host "Archivos creados:"
Get-ChildItem $OutputDir

Write-Host "`nContenido de archivos:"
Get-ChildItem $OutputDir | ForEach-Object {
    Write-Host "---- $($_.Name) ----"
    Get-Content $_.FullName
}