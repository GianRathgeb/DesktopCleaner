# This script cleans your desktop
# Moves files from Users Desktop to C:\desktop


$strUserName = "$env:username"
$strUserDesktopPath = "C:\Users\$strUserName\Desktop"
$strDesktopDestination = "C:\desktop$strUserName"

If (-Not (Test-Path $strDesktopDestination)) {
    New-Item "$strDesktopDestination" -ItemType "directory"
}

$files = Get-ChildItem $strUserDesktopPath
for ($i = 0; $i -lt $files.Count; $i ++) {
    $file = $files[$i]
    Move-Item -Path "$strUserDesktopPath\$file" -Destination $strDesktopDestination
}
