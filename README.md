# DayZ-Mod-Template
Mod Template for DayZ Standalone. Includes build tools, gproj, and script folders

### Setup
```
1.) Clone the following repositories to your PC. Do NOT put them on your P: drive. You can use your favorite Git client, most of us use Github Desktop
https://github.com/InclementDab/DayZ-Dabs-Framework
https://github.com/Arkensor/DayZ-CommunityFramework

2.) Clone your new templated repository onto your PC. Using your favorite text editor, rename all instances of ModTemplate to YourModPrefix, including the two folders

3.) In all three repositories, there is a "SetupWorkdrive.bat" file. Run this after you've finished cloning / downloading.

4.) Navigate to P:/YourModPrefix/Workbench (this will be created by the SetupWorkdrive.bat)

5.) Double click dayz.gproj - if prompted to run with an application, be sure to choose Workbench (you can find this in steamapps/common/DayZ Tools/Bin/Workbench)

6.) Upon opening workbench, navigate to Workbench -> Options on the top navbar. Set "Source Data Directory" to your DayZ install location (example: C:/Program Files (x86)/Steam/steamapps/common/DayZ Exp). Restart workbench when prompted. (Upon restarting you will need to close and reopen P:/YourModPrefix/dayz.gproj)

7.) Navigate to Plugins -> Settings -> Configure Project (note: if the plugins folder is empty, you may need to click 'Settings -> Reload WB Scripts')

8.) Set the Repository value to the installation location of your downloaded mod. (example: C:\Dev\proj\DayZ-Mod-Prefix)

9.) (optional) Enable FilePatching in your configuration. This will be handled by the plugin automatically and load scripts / gui ingame without a repack required.

10.) Press F6, or Plugins -> Launch Game . If you've installed everything properly (and have all of our mods downloaded) your game will launch with a virtual mission created in your P:/ drive. 

11.) (not optional) Make some badass mods 

```

Any folders inside of the ModTemplate directory will be converted into PBO's (excluding the Workbench folder)

DayZ Workbench Wiki:
https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging#Filepatching
