#include "BaseControls.hpp"
#include "displays\basic.hpp"

class CfgPatches {
	
    class bsf_ui {
		
		author = "bsf";
        requiredAddons[] = {};
        requiredVersion = 0.1;
        units[] = {};
        weapons[] = {};
    };
};


class CfgFunctions  {
    class bsf_computer {
        class debug {
            file = "z\bsf\addons\ui\functions";
            class createui {};
        };
    };
};