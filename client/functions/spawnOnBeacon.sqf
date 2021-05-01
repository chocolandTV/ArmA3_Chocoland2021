//filename : spawnOnBeacon.sqf
private ["_beacon","_beacons", "_pos",  "_playerPos","_var"];
9999 cutText ["", "BLACK", 0.01];
waitUntil {isNil "playerData_alive" || !isNil "playerData_resetPos"};

playerData_alive = nil;
playerData_resetPos = nil;
player enableSimulation true;
respawnDialogActive = true;
if (KEEPWEAPON)then{
	{ 
		player addWeapon _x;
		_mag = (getArray (configFile >> "Cfgweapons" >> _x >> "magazines")) select 0;
		player addMagazine [_mag,2];
	} forEach OLDWEAPONS;
};
//respawn func
[player, false] call fn_hideObjectGlobal;
player allowDamage true;
_beacon = objNull;
_uid = getPlayerUID player;
_beacons = nearestObjects [player, ["Land_TentDome_F"], 100000];
{
_var= _x getVariable ["ownerUID", false];
if (_var == _uid)then
	{
	_beacon = _x;
	_playerPos = getpos _beacon;
	}
} forEach _beacons;

if(isNull _beacon) then
{
_pos = getMarkerPos "RespawnRandom";
_playerPos =[[[_pos, 6000]],["water"]] call BIS_fnc_randomPos;
};
_playerPos set [2, 600];
//player init
player setPos _playerPos;
9999 cutText ["", "BLACK IN"];
playerSpawning = false;
player setVariable ["playerSpawning", false, true];
waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};
respawnDialogActive = false;
closeDialog 0;
_hour = date select 3;
_mins = date select 4;
["Chocoland", format ["%1'%2 FreeSpawn", name player, ""], format ["%1:%3%2", _hour, _mins, if (_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

