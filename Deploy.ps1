
# Prompt for version
[Version]$version = Read-Host -Prompt "Version Number (1.0.0)"

# Prompt for deploy location (bit cursed but itll work)
$host_location = "C:\Dev\proj\inclementdab.gitlab.io"

while (-Not (Test-Path $host_location)) {
    $host_location = Read-Host -Prompt "Output Folder (C:\Dev\proj\inclementdab.gitlab.io\template)"
}

$pack_name = "ModTemplate-$Version"
$pack_source = Join-Path -Path $host_location -ChildPath "\template\packages\$pack_name"
$pack_version = Join-Path -Path $host_location -ChildPath "\template\CURRENT"

# Check if the folder exists
if (Test-Path $pack_source) {
    Remove-Item -Path $pack_source -Recurse -Force
} 

# Create download folder
New-Item -Path $pack_source -ItemType Directory

# Copy directories excluding Packed Name
Get-ChildItem -Path . -Directory | Where-Object {$_.Name -ne $pack_name } | Copy-Item -Destination $pack_source -Recurse

# Copy files excluding Deploy.ps1
Get-ChildItem -Path . -File | Where-Object { $_.Name -ne 'Deploy.ps1' } | Copy-Item -Destination $pack_source

# Zip the files up
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($pack_source, $pack_source + ".zip")

# Remove pack folder
Remove-Item -Path $pack_source -Recurse -Force

# Update version number
Set-Content -Path $pack_version $version