
class CfgPatches
{
	class ModTemplate_Scripts
	{
        requiredVersion = 0.1;
		requiredAddons[] = {"DZ_Scripts"};
	};
};

class CfgMods 
{
	class ModTemplate
	{
		name = "DayZ-Mod-Template";
		dir = "ModTemplate";
		creditsJson = "ModTemplate/Scripts/Credits.json";
		inputs = "ModTemplate/Scripts/Inputs.xml";
		type = "mod";

		dependencies[] =
		{
			"Game", "World", "Mission"
		};
		class defs
		{
			class imageSets
			{
				files[]= {};
			};
			class engineScriptModule
			{
				files[] =
				{
					"ModTemplate/scripts/1_core"
				};
			};

			class gameScriptModule
			{
				files[] = 
				{
					"ModTemplate/scripts/3_Game"
				};
			};
			class worldScriptModule
			{
				files[] = 
				{
					"ModTemplate/scripts/4_World"
				};
			};

			class missionScriptModule 
			{
				files[] = 
				{
					"ModTemplate/scripts/5_Mission"
				};
			};
		};
	};
};
