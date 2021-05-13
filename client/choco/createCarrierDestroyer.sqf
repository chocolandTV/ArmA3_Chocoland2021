closeDialog 0;
private ["_obj"];
params ["_skin"];

titleText ["***********<br/><t color='#ff0000' size='2'>Requesting Ship on following coordinates!</t><br/>click to Spawn( dont spawn on island or over other Carriers!)", "PLAIN DOWN", -1, true, true];

["A3W_teleport", "onMapSingleClick",
{
	private "_pos";
	
	_obj = createVehicle [_skin, _pos, [], 0, "NONE"];
	_obj setVariable ["ownerUID", getPlayerUID _player, true];
	_obj setVariable ["objectLocked", true, true];
	_obj setDamage (0.00);
	_obj allowdamage true;
	_obj enableCollisionWith player;
	OBJ = _obj;
	publicVariable"OBJ";
	chocostring = "OBJ enableCollisionWith player;";
	publicVariable"chocostring";
	
	["A3W_teleport", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	true
}
] call BIS_fnc_addStackedEventHandler;

titleText ["***********<br/><t color='#ff0000' size='2'>Requested Carrier / Destroyer delievered!</t><br/>***********", "PLAIN DOWN", -1, true, true];
