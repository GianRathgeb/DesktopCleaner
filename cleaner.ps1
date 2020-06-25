# This script cleans your desktop
# Moves files from Users Desktop to C:\desktop

# Define variables
$strUserName = "$env:username"
$strUserDesktopPath = "C:\Users\$strUserName\Desktop"
$strDesktopDestination = "C:\desktop$strUserName"

# Check if desktop on C: exists, if not create ist.
If (-Not (Test-Path $strDesktopDestination)) {
    New-Item "$strDesktopDestination" -ItemType "directory"
}
# Get list of files
$files = Get-ChildItem $strUserDesktopPath
for ($i = 0; $i -lt $files.Count; $i ++) {
    #  Move files
    $file = $files[$i]
    Move-Item -Path "$strUserDesktopPath\$file" -Destination $strDesktopDestination
}
