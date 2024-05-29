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

#### Mounting to the Workdrive

1. **Run the Batch File to Mount**:
   - Navigate to the `SetupWorkdrive.bat` file in your mod directory.
     ```
     ../DayZ-Mod-Name/SetupWorkdrive.bat 
     ```
   - Execute this batch file. It will automatically mount all folders containing a 'Workbench' folder in your repository directory to your Workdrive.

#### Opening the Project in Workbench

1. **Access the Project Directory**:
   - Go to the mod's project directory:
     ```
     ../DayZ-Mod-Name/ModName/Workbench
     ```
   - Here, you will find the `dayz.gproj` file.

2. **Open the Project File**:
   - Double-click on `dayz.gproj`.
   - If prompted, choose to open it with Workbench. You can find Workbench in `steamapps/common/DayZ Tools/Bin/Workbench`.

#### With [Dabs Framework](https://github.com/InclementDab/DayZ-Dabs-Framework) on your machine, your project will automatically have plugins built-in. To use these plugins, follow `Using the Workbench Plugins` in the wiki.


## License

Your tool is licensed under [MIT License](LICENSE.md).

For any additional questions or feedback, please raise an issue in this repository or contact [Dab](mailto:inclementdab@gmail.com).
