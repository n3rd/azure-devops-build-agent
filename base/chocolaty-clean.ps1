Write-Host "Running Chocolatey clean up..."

Write-Host "clean Chocolatey temp..."
Remove-Item -Path "$env:tmp\chocolatey\" -Recurse -Force

Write-Host "clean Chocolatey lib..."
Remove-Item -Path "$env:chocolateyinstall\lib\" -Recurse -Force

Write-Host "clean Chocolatey logs..."
Remove-Item -Path "$env:chocolateyinstall\logs\" -Recurse -Force