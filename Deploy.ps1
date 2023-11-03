
# Prompt for deploy location (bit cursed but itll work)
$host_location = "C:/Dev/proj/inclementdab.gitlab.io"
$pack_version = Join-Path -Path $host_location -ChildPath "/template/CURRENT"

[Version]$host_version = Get-Content $pack_version

# Prompt for version
$version_string = Read-Host -Prompt "Version Number (Current $host_version)"

[Version]$version = $null

# If empty, just increment build
if ("" -eq $version_string) {
    $version = New-Object -TypeName System.Version -ArgumentList $host_version.Major, $host_version.Minor, ($host_version.Build + 1)
} else {
    $version = $version_string
}

while (-Not (Test-Path $host_location)) {
    $host_location = Read-Host -Prompt "Output Folder (C:/Dev/proj/inclementdab.gitlab.io/template)"
}

$pack_name = "ModTemplate-$Version"
$pack_source = Join-Path -Path $host_location -ChildPath "/template/packages/$pack_name"
$pack_source_zip = $pack_source + ".zip";

# Check if the folder exists
if (Test-Path $pack_source) {
    Remove-Item -Path $pack_source -Recurse -Force
} 

# You can overwrite versions, be warned
if (Test-Path $pack_source_zip) {
    Write-Error "Version $pack_name already exists"
    return
}

# Create download folder
New-Item -Path $pack_source -ItemType Directory

# Copy directories excluding Packed Name
Get-ChildItem -Path . -Directory | Where-Object {$_.Name -ne $pack_name } | Copy-Item -Destination $pack_source -Recurse

# Copy files excluding Deploy.ps1
Get-ChildItem -Path . -File | Where-Object { $_.Name -ne 'Deploy.ps1' } | Copy-Item -Destination $pack_source

# Zip the files up
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($pack_source, $pack_source_zip)

# Remove pack folder
Remove-Item -Path $pack_source -Recurse -Force

# Update version number
Set-Content -Path $pack_version $version

Set-Location $host_location

# Super cursed but im not dealing with credentials, its all auto-built from git
git fetch
git pull

git checkout main

git add $pack_source_zip
git add $pack_version
git commit -m "$pack_name"
git push