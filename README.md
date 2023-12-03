# DayZ-Mod-Template

A Comprehensive Mod Template for DayZ. Optimized with Workbench for Advanced Scripting and pboProject for Efficient Building.
This is my personal template, that I ues for all projects

# Repository Setup

Follow these steps to clone the DayZ Mod Template, set up your project environment, and initialize your own Git repository.

#### Creating Your Project from a Template

1. **Use the Template Repository**:
   - Navigate to the DayZ Mod Template repository on GitHub: `https://github.com/InclementDab/DayZ-Mod-Template`
   - Click on the "Use this template" button near the top of the repository page.

2. **Set Up Your New Repository**:
   - Enter a name for your new repository, like `DayZ-Mod-Name`.
   - Optionally, provide a description.
   - Choose the repository visibility (public or private).
   - Click on "Create repository from template" to generate your new repository.

#### Cloning Your New Repository

3. **Clone Your New Repository**:
   - Once your repository is created, clone it to your local machine:
     ```bash
     git clone https://github.com/yourusername/DayZ-Mod-Name.git
     ```
   - Replace `yourusername` with your actual GitHub username.

4. **Navigate to the Cloned Directory**:
   - Change your directory to the one you just cloned:
     ```bash
     cd DayZ-Mod-Name
     ```

5. **Run the Installation Script**:
   - If the template includes an installation script (`Install.ps1`), run it:
     ```bash
     ./Install.ps1
     ```

# Workbench

## Mounting your Mod to the P Drive

1. **Run the Batch File to Mount the Mod**:
   - Navigate to the `SetupWorkdrive.bat` file in your mod directory.
     ```
     ../DayZ-Mod-Name/SetupWorkdrive.bat 
     ```
   - Execute this batch file. It will automatically mount all folders containing a 'Workbench' folder in your repository directory to your Workdrive (P Drive).

## Opening the Project in Workbench

1. **Access the Project Directory**:
   - Go to the mod's project directory:
     ```
     ../DayZ-Mod-Name/ModName/Workbench
     ```
   - Here, you will find the `dayz.gproj` file.

2. **Open the Project File**:
   - Double-click on `dayz.gproj`.
   - If prompted, choose to open it with Workbench. You can find Workbench in `steamapps/common/DayZ Tools/Bin/Workbench`.

## Configuring Source Data Directory in Workbench

This step only needs to be completed one time, unless you change your DayZ install directory.

1. **Set the Source Data Directory**:
   - In Workbench, navigate to `Workbench -> Options`.
   - Set "Source Data Directory" to your DayZ installation path, such as `C:/Program Files (x86)/Steam/steamapps/common/DayZ Exp`.

2. **Handle the Restart Prompt**:
   - Upon setting the directory, a prompt to restart Workbench will appear. Select 'No' to decline this automatic restart.

3. **Manually Restart Workbench**:
   - Close the Resource Browser to ensure all settings are applied.
   - Exit and then reopen Workbench.
   - Reopen the `dayz.gproj` file.

## Configuring the Project

This step only needs to be completed when the project is installed to your machine

1. **Set Up Project Configuration**:
   - In Workbench, go to `Plugins -> Settings -> Configure Project`.
   - Set the Repository path to your mod's location, for example, `C:/Dev/proj/DayZ-Dabs-Framework`.


## Building the Project

1. **Build the Project**
    - In Workbench Build Project `(Plugins -> Build Mod)`
    - Any folders inside of the ModTemplate with a config.cpp directory will be converted into PBO's on build. By default pboProject is used to build. This can be changed in Build configuration


## Shortcuts

| Key          | Command                     |
|--------------|-----------------------------|
| <kbd>F6</kbd> | Launch Game |
| <kbd>F8</kbd> | Build Mod |
| <kbd>Ctrl</kbd> + <kbd>F6</kbd> | Configure Project |
| <kbd>Ctrl</kbd> + <kbd>F8</kbd> | Configure Build |
| <kbd>F5</kbd> | Join Remote Game |
| <kbd>F10</kbd> | Close Game |
| <kbd>Ctrl</kbd> + <kbd>N</kbd> | Create New File |
| <kbd>Ctrl</kbd> + <kbd>-</kbd> | Open Current Directory |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>F2</kbd> | Rename Current File |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Delete</kbd> | Delete Current File |


You can find more information on the [DayZ Workbench Wiki](https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging)


## License

Your tool is licensed under [MIT License](LICENSE.md).

For any additional questions or feedback, please raise an issue in this repository or contact [Dab](mailto:inclementdab@gmail.com).