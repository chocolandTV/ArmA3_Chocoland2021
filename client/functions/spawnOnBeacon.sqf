//filename : spawnOnBeacon.sqf
private ["_beacon","_beacons", "_pos",  "_playerPos","_var"];
respawnDialogActive = true;
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
_playerPos =[[[_pos, 2300]],[]] call BIS_fnc_randomPos;
};
_playerPos set [2, 600];
player setPos _playerPos;

waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};
respawnDialogActive = false;
closeDialog 0;
	_hour = date select 3;
	_mins = date select 4;
	["Chocoland", format ["%1'%2 FreeSpawn", name player, ""], format ["%1:%3%2", _hour, _mins, if (_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

