class CfgPatches
{
	class MT_Scripts
	{
		requiredAddons[] = { "DZ_Scripts" };
	};
};

class CfgAddons
{
    class PreloadAddons
    {
        class ModTemplate
        {
            list[]={};
        };
    };
};

class CfgMods
{
    class ModTemplate
    {
        name="";
        dir="ModTemplate";
        picture="";
        action="";
        author="";
        overview = "";
		inputs = "";
		type = "mod";
        defines[] = {};

        class defs
		{
			class imageSets
			{
				files[]= {};
			};
			class widgetStyles
			{
				files[]= {};
			};

			class engineScriptModule 
			{ 
				files[] = { "ModTemplate/Scripts/1_Core"};
			};

			class gameScriptModule
			{
				files[] = { "ModTemplate/Scripts/3_Game" };
			};
			class worldScriptModule
			{
				files[] = { "ModTemplate/Scripts/4_World" };
			};

			class missionScriptModule 
			{
				files[] = { "ModTemplate/Scripts/5_Mission" };
			};
		};
    };
};