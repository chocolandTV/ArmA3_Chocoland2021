closeDialog 0;
private ["_skin","_obj", "_pos"];
_skin = _this select 0;

titleText ["***********<br/><t color='#ff0000' size='2'>Requesting Ship on following coordinates!</t><br/>click to Spawn( dont spawn on island or over other Carriers!)", "PLAIN DOWN", -1, true, true];
_createShip= {
_pos1= _this select 0;
_obj = createVehicle [_skin, _pos1, [], 0, "NONE"];
_obj setVariable ["A3W_purchasedStoreObject", true];
_obj setVariable ["ownerUID", getPlayerUID _player, true];
_obj setVariable ["objectLocked", true, true];
_obj setVariable ["ownerName", name _player, true];
_obj setPlateNumber name _player;
_obj setDamage (0.00);
_obj allowdamage true;
[_obj, player] remoteExecCall ["enableCollisionWith", 0, _obj];

titleText ["***********<br/><t color='#ff0000' size='2'>Requested Carrier / Destroyer delievered!</t><br/>***********", "PLAIN DOWN", -1, true, true];
};
openMap true;
ClickOnMapEH = addMissionEventHandler ["MapSingleClick", {[(_this select 1)] spawn _createShip; removeMissionEventHandler ["MapSingleClick",ClickOnMapEH];}];



