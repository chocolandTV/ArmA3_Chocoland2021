//	@file Name: dropSupply.sqf
if (!isServer) exitWith { _this remoteExecCall ["Choco_fnc_dropSupply", 2] };
private["_uid","_targetUID","_time","_player","_pos","_dir","_objectType","_weapon", "_obj", "_mag","_para","_seed"];

_uid = _this select 0;
_time = _this select 1;

if (isNil "_uid" || isNil "_time" )exitWith {diag_log format ["no enty _uid=%1 , _time = %2",_uid,_time];};
{
	if(getPlayerUID _x  == _uid)then
	{_player = _x;};
} forEach playableUnits; 
diag_log format ["####### Choco Script UID Spawning Start ###### - spawns %1 for player %2 for %3 seconds",_objectType,name _player, _time];
for "_i" from 1 to _time do 
{
	_player = _this select 0;
	_seed = [1,101] call BIS_fnc_randomInt;
	if (_seed <30) then {_objectType = selectRandom vehicleList;}
	else
		{if (_seed <60) then {_objectType = selectRandom airVehicles;}
			else{_objectType = selectRandom objectList;};
	_pos= getPosASL _player;
	_dir= getDir _player;
	_pos = [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir),(_pos select 2)-20];
	_obj = createVehicle [_objectType, _pos, [], 0, "NONE"];
	_obj allowdamage false;
	_weapon = selectRandom randomweaponarray;
	_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
	_obj addMagazineCargoglobal [_mag,1];
	_obj addWeaponCargoglobal [_weapon,1];
	_obj setVariable ["allowDamage", true, true];
	_para = createVehicle ["I_Parachute_02_F", _pos, [], 0, ""];
	_para setPosASL _pos;
	_obj attachTo [_para,[0,0,0]]; 
	waitUntil{sleep 1;(getpos _obj select 2) < 2};
	deTach _obj;
	sleep 2;
	deleteVehicle _para;
	_obj setDamage (0.00);
	_obj allowdamage true;
	_obj setVectorUp [0,0,1];
	sleep 1;
	diag_log format ["####### Choco Script UID Spawning Finish ###### - spawns %1 for player %2",_objectType, name _player];
};