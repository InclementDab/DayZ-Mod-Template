$prefix = Read-Host -Prompt 'Enter your mod prefix...'

$folders = Get-ChildItem -Directory -Recurse

Write-Host "Creating empty folders..."

New-Item -Path "Missions\" -Name "Global" -ItemType Directory
New-Item -Path "Missions\" -Name "Dev" -ItemType Directory

# Individual script modules get their own sub-folders for wb organization
New-Item -Path "ModTemplate\Scripts\1_Core" -Name $prefix -ItemType Directory
New-Item -Path "ModTemplate\Scripts\3_Game" -Name $prefix -ItemType Directory
New-Item -Path "ModTemplate\Scripts\4_World" -Name $prefix -ItemType Directory
New-Item -Path "ModTemplate\Scripts\5_Mission" -Name $prefix -ItemType Directory

Write-Host "Renaming folders..."

foreach ($folder in $folders) {
    if ($folder.Name -like "*ModTemplate*") {
        # Construct the new folder name
        $new_name = $folder.Name -replace "ModTemplate", $prefix

        # Rename the folder
        #Rename-Item -Path $folder.FullName -NewName $new_name
    
        Write-Host "Renamed '$($folder.Name)' to '$new_name'" -ForegroundColor Green
    }
}

# Prompt user for input
$git_enable = $null
while ($git_enable -ne 'y' -and $git_enable -ne 'n') {
    $git_enable = Read-Host "Do you want to create a git repository in this directory? (y/n)"
}

# Check the user's choice
if ($git_enable -eq 'y') {
    if (Test-Path ".git") {
        Write-Host "Existing repository detected" -ForegroundColor Yellow
        $remotes = git remote
        if (-not $remotes) {
            Write-Host "Repository had no remotes, removing..." -ForegroundColor Yellow
        } else {
            Write-Host "Remotes detected" -ForegroundColor Red
        }

    }


    # Initialize a new git repository
    #git init

    Write-Host "Initializing Git Repository..." -ForegroundColor Yellow


    Write-Host "Git repository initialized successfully." -ForegroundColor Green
}


