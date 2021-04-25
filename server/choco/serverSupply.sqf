if (!isServer) exitWith {};
private["_player", "_seed", "_objectType", "_pos", "_obj", "_weapon", "_mag"];
SERVERSPAWNTIME= 300;
SERVERSPAWNING = true;
// server loopSpawn
while {SERVERSPAWNING} do
{ 
{

	diag_log format ["####### Choco Player Spawning ###### -found player %1",name _x];
	_player = _x;
	_seed = [1,101] call BIS_fnc_randomInt;
	if (_seed <30) then {_objectType = selectRandom vehicleList;}
	else
		{if (_seed <60) then {_objectType = selectRandom airVehicles;}
			else{_objectType = selectRandom objectList;};
	_pos= getPosASL _player;
	_pos = [_pos, 100, 500, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_obj = createVehicle [_objectType, _pos, [], 0, "CAN_COLLIDE"];
	_obj allowdamage false;
	_weapon = selectRandom randomweaponarray;
	_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
	_obj addMagazineCargoglobal [_mag,2];
	_obj addWeaponCargoglobal [_weapon,2];
	_obj setVariable ["allowDamage", true, true];
	_obj setDamage 0;
	_obj allowdamage true;
	

}forEach playableUnits;

sleep SERVERSPAWNTIME;
	
};