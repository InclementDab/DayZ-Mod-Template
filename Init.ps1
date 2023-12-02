
# Magic C++ stuff
Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class ForwardWindow {
            [DllImport("user32.dll")]
            public static extern bool SetForegroundWindow(IntPtr hWnd);
            [DllImport("kernel32.dll")]
            public static extern IntPtr GetConsoleWindow();
        }
"@ 

function Get-ToolsVersion {
    $version_file = Join-Path -Path "$PSScriptRoot\..\ToolAddons" -ChildPath "VERSION"

    if (-Not (Test-Path -Path $version_file)) {
        return "0.0.0"
    }

    return Get-Content $version_file
}

# Downloads tools from website, returns where it downloaded to your PC
function Download-Tools {
    param (
        [Version]$Version
    )

    $url = "https://dab.dev/template/packages/ModTemplate-$Version.zip"
    $destination = Join-Path -Path $env:TEMP -ChildPath "ModTemplate-$Version.zip"
    if (Test-Path -Path $destination) {
        Write-Host "File $destination already exists, skipping..."
        return $destination
    }

    Write-Host "Downloading file '$url'"
    Invoke-WebRequest -Uri $url -OutFile $destination
    return $destination
}

function Get-RepositoryRoot {
    return (Get-Item $PSScriptRoot).parent.parent.parent.FullName;
}

function Get-ModPrefix {
    return (Get-Item $PSScriptRoot).parent.parent.Name;
}

function Get-Workdrive {
    $workdrive = "P:\"

    while (-Not (Test-Path -Path $workdrive)) {
        # Get workdrive
        [void] [ForwardWindow]::SetForegroundWindow([ForwardWindow]::GetConsoleWindow())

        Add-Type -AssemblyName System.Windows.Forms
        $file_browser = New-Object System.Windows.Forms.FolderBrowserDialog
        $file_browser.Description = "Select A Folder"
        $file_browser.SelectedPath = $workdrive

        if ($file_browser.ShowDialog() -eq "OK") {
            Write-Host $file_browser.SelectedPath
        }
    }

    return $workdrive
}

### END COMMON, START SCRIPT

$current_item = Get-Item .
$name = $current_item.Name
$target_directory = $current_item.FullName

$template_token = "ModTemplate"

if (-not (Test-Path (Join-Path $target_directory $template_token))) {
    Write-Host "Running re-initialization script" -ForegroundColor Yellow
    $template_token = Read-Host "Enter your current mod prefix name (ModName)"
}

# Get user input
$prefix = Read-Host -Prompt 'Enter your mod prefix (ModName)'
$prefix = $prefix.Replace(" ", "")
$prefix = $prefix.Replace("\t", "")
$prefix = $prefix.Replace("\n", "")
if ("" -eq $prefix) {
    $prefix = "ModName"
}

if ("DayZ-Mod-Template" -eq $name) {
    Write-Error "Invalid Mod Name ($name)"
    Read-Host "Press Enter to exit..."
    return
}

# Create script folders
New-Item -Path (Join-Path $current_item.FullName "$template_token\Scripts\1_Core\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "$template_token\Scripts\3_Game\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "$template_token\Scripts\4_World\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "$template_token\Scripts\5_Mission\$prefix") -ItemType Directory

New-Item -Path (Join-Path $current_item.FullName "Missions\Dev") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "Missions\Global") -ItemType Directory

New-Item -Path (Join-Path $current_item.FullName "Profiles\Dev") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "Profiles\Global") -ItemType Directory

# Rename all ModTemplate folders
foreach ($folder in Get-ChildItem -Directory $target_directory -Recurse) {
    if ($folder.Name.Contains($template_token) -and ($template_token -ne $prefix)) {
        $new_name = $folder.FullName.Replace($template_token, $prefix)
        Rename-Item -Path $folder.FullName -NewName $new_name
    }
}

# Get all .cpp, .c, and .gproj files in the current directory and its subdirectories
$files = Get-ChildItem -Recurse -Include *.cpp, *.gproj, *.cfg -Depth 32

foreach ($file in $files) {
    # Read the contents of the file
    $content = Get-Content $file.FullName

    # Replace 'ModTemplate' with the value of $prefix
    $updatedContent = $content -replace 'ModTemplate', $prefix

    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $updatedContent
}

# Run Setupworkdrive
.\SetupWorkdrive.bat