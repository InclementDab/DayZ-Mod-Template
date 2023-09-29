# DayZ-Mod-Template
Mod Template for DayZ Standalone. Includes build tools, gproj, and script folders

### Setup
```
0.) Ensure (Dabs Framework)[https://github.com/InclementDab/DayZ-Dabs-Framework] is on your P drive. Clone and run SetupWorkdrive.bat for this setup
1.) Clone into hard drive outside of your P drive
2.) Use VSCode to rename every instance of ModTemplate to your ModPrefixName, and manually rename the two folders
3.) Run SetupWorkdrive.bat
4.) Open dayz.gproj by double clicking it and opening with workbench
5.) Navigate to the Script Editor via Script -> Editor at the top bar
6.) Press F7 to recompile
7.) Press Ctrl + F6 to configure the mod, you only need to configure Repository (link it directly to your repository location i.e. C:\DayZ-Mod-Template)
```

Any folders inside of the ModTemplate directory will be converted into PBO's (excluding the Workbench folder)

DayZ Workbench Wiki:
https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging#Filepatching
