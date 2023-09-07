class CfgPatches {
	
    class bsf_lib {
		
		author = "bsf";
        requiredAddons[] = {};
        requiredVersion = 0.1;
        units[] = {};
        weapons[] = {};
    };
};


class CfgFactionClasses
{
	class NO_CATEGORY;
	class bsf_gas: NO_CATEGORY
	{
		displayName = "Gas";
	};
};


class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription
		{
			class AnyBrain;
		};
	};

	class bsf_lib_gas: Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Gas";				// Name displayed in the menu
		category = "NO_CATEGORY";

		function = "bsf_lib_fnc_gas";	// Name of function triggered once conditions are met
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 1;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;				// 1 for module waiting until all synced triggers are activated
		curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus
        canSetArea = 1;
        canSetAreaShape = 1;
		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes: AttributesBase
		{

			class ModuleDescription: ModuleDescription{}; // Module description should be shown last
		};

		// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
		class ModuleDescription: ModuleDescription
		{
			description = "this modules places deadly gas in a defined area";	// Short description, will be formatted as structured text
		};
	};
};

class CfgFunctions  {
    class bsf_lib {
        class debug {
            file = "z\bsf\addons\lib\functions";
            class ping {};
        };
        class general {
            file = "z\bsf\addons\lib\functions";
            class gas {};
        };
    };
};