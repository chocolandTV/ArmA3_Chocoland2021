
_screen_effect			= _this select 0 select 0;
	_red				= _this select 0 select 1;
	_green				= _this select 0 select 2;
	_blue				= _this select 0 select 3;
_fallout_ash			= _this select 1;
_earthquake				= _this select 2 select 0;
	_interval_quake		= _this select 2 select 1;
	_destructive_quake	= _this select 2 select 2;
_ambient_random_sound	= _this select 3 select 0;
	_interval_sound		= _this select 2 select 1;
	
sound_pool = ["ambient_com","ambient_fantoma","ambient_fundal","ambient_hall","ambient_industrial","ambient_jet","ambient_spike","ambient_steps","ambient_tehnic","ambient_vuumm","ambient_wind"];
publicVariable "sound_pool";


if (_screen_effect) then {

[_red,_green,_blue] execVM "AL_post\alias_screen.sqf";
};
if (_fallout_ash) then {
ASHSCRIPT =[] execVM "AL_post\alias_ash.sqf";
};
if (_ambient_random_sound) then {
[_interval_sound] execVM "AL_post\umblator.sqf";
};
if (_earthquake) then {
	sleep 10;
	while {_earthquake} do 
	{
		_qk_sound = ["earthquake_03","earthquake_02"] call BIS_fnc_selectRandom;
		[_qk_sound] execVM "AL_post\quake_client.sqf";
		sleep _interval_quake; //sleep 60 + (random _interval_quake);
	};
};