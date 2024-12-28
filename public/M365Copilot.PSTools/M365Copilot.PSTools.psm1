# Load the preImport script to set up the environment
. "$PSScriptRoot\internal\scripts\preImport.ps1"

# Load the functions and scripts from the internal and public folders
foreach ($file in Get-ChildItem -Path "$PSScriptRoot/internal/functions" -Filter *.ps1 -Recurse) {
    . $file.FullName
}

foreach ($file in Get-ChildItem -Path "$PSScriptRoot/functions" -Filter *.ps1 -Recurse) {
    . $file.FullName
}

foreach ($file in Get-ChildItem -Path "$PSScriptRoot/internal/scripts" -Filter *.ps1 -Recurse -Exclude "preImport.ps1") {
    . $file.FullName
}