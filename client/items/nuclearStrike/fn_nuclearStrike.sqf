private "_pos";
diag_log format ["Nuclear Strike - %1", [_UID, _player, name _player, side group _player, owner _player, remoteExecutedOwner, _pos, mapGridPosition _pos]];

nuclearStrike= {
_pos = _this select 0;
for "_i" from 1 to 100 do
	{
	_ipos = _pos vectorAdd ([[random 500, 0, 2500], random 360] call BIS_fnc_rotateVector2D); 
	_shell = createVehicle ["R_230mm_fly", _ipos, [], 0, "NONE"];
	_shell setShotParents [player, objNull];
	_shell setVelocity [0,0,-150];
	sleep 0.001;
	};
	
};
openMap true;
ClickOnMapEH = addMissionEventHandler ["MapSingleClick", {[(_this select 1)] spawn nuclearStrike;openMap false;}];
waitUntil {!visibleMap}; // Wait until map is closed, either by ESC/M or map click
removeMissionEventHandler ["MapSingleClick",ClickOnMapEH]; // removes eventhandler so it doesn´t stack and spawn more than one vehicle
