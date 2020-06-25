# This script reverses the cleaning process of your desktop
# Moves files from C:\desktop to Users Desktop


$strUserName = "$env:username"
$strUserDesktopPath = "C:\Users\$strUserName\Desktop"
$strDesktopDestination = "C:\desktop$strUserName"

$files = Get-ChildItem $strDesktopDestination
for ($i = 0; $i -lt $files.Count; $i ++) {
    $file = $files[$i]
    Move-Item -Path "$strDesktopDestination\$file" -Destination $strUserDesktopPath
}
