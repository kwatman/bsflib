// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))

_activated = param [2,true,[true]];

_objectarea = _logic getVariable "objectarea";
_area = [getPos _logic] + _objectarea;

[_logic getVariable "DamageIncrease",_area, _logic getVariable "DamageInterval", _logic getVariable "UnconsciousTime",_logic getVariable "UnconsciousTimeDeath"] call bsf_lib_fnc_gas;

// Module function is executed by spawn command, so returned value is not necessary, but it is good practice.
true;