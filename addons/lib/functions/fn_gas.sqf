params ["_dmgIncrease","_area","_dmgInterval","_unconsciousTime","_unconsciousTimeDeath"];

while {true} do {
	sleep 1;
	{
		_unit = _x;                
		private ['_timer','_dmg','_GasMask'];  
  
		_GasMask = ['G_RegulatorMask_F','G_AirPurifyingRespirator_01_F','G_AirPurifyingRespirator_01_nofilter_F','G_AirPurifyingRespirator_02_black_F','G_AirPurifyingRespirator_02_olive_F','G_AirPurifyingRespirator_02_sand_F'];  

		while {alive _unit && local _unit} do  
		{  
			waitUntil {sleep 0.5; _unit inArea _area && !(goggles _unit in _GasMask)};  

			if (isPlayer _unit) then  
				{  
				_unit setVariable ['radiat', ppEffectCreate ['ChromAberration', 200]];  
				(_unit getVariable 'radiat') ppEffectEnable true;  
				(_unit getVariable 'radiat') ppEffectAdjust [0.03, 0.03, true];  
				(_unit getVariable 'radiat') ppEffectCommit 10;  

				_unit setVariable ['radiat2', ppEffectCreate ['ColorInversion', 500]];  
				(_unit getVariable 'radiat2') ppEffectEnable true;  
				(_unit getVariable 'radiat2') ppEffectAdjust [0.0, 0.0, 0.2];  
				(_unit getVariable 'radiat2') ppEffectCommit 10;   
				playSound3D ["A3\Sounds_F\characters\human-sfx\Person1\P1_breath_high_14_z.wss", player]; 
			};  
			_dmg   = getDammage _unit;  
			_dmgTrack = 0;
			_sleepTrack = 0;

			if (!(goggles _unit in _GasMask)) then {
				waitUntil {
					sleep _dmgInterval;
					[_unit, _dmgIncrease] call ace_medical_fnc_adjustPainLevel;
					_dmgTrack = _dmgTrack + _dmgIncrease;
					_dmgTrack > 1;
				};
				if(_unit inArea _area) then {
					waitUntil {
						sleep 1;
						[_unit, true, _unconsciousTime, false] call ace_medical_fnc_setUnconscious;
						_sleepTrack = _sleepTrack + 1;
						_sleepTrack > _unconsciousTimeDeath or !(_unit inArea _area);					
					};
				};
				if(_unit inArea _area) then {
					_unit setDamage 1;
				} else {
					sleep _unconsciousTime;
					[_unit, false] call ace_medical_fnc_setUnconscious;
				};
			};

			if (isPlayer _unit) then  
			{  
					_unit setVariable ['noradiat', ppEffectCreate ['ChromAberration', 200]];  
					(_unit getVariable 'noradiat') ppEffectEnable true;  
					(_unit getVariable 'noradiat') ppEffectAdjust [0.0, 0.0, true];  
					(_unit getVariable 'noradiat') ppEffectCommit 10;  

					_unit setVariable ['noradiat2', ppEffectCreate ['ColorInversion', 500]];  
					(_unit getVariable 'noradiat2') ppEffectEnable true;  
					(_unit getVariable 'noradiat2') ppEffectAdjust [0, 0, 0];  
					(_unit getVariable 'noradiat2') ppEffectCommit 10;  
					playSound3D ["A3\Sounds_F\characters\human-sfx\Person1\P1_breath_high_14_z.wss", player]; 
			};  
		}  

	} forEach allUnits;
};