diag_log format ["####### basecore started ###### "];
private ["_pos","_objClass","_obj","_countMoney","_dummyUnit", "_group","_nic"];
_pos = getPosASL player;
_objClass = "Land_Device_assembled_F";
_obj = createVehicle [_objClass, _pos, [], 0, "NONE"];
_obj allowDamage true;
_obj setVariable ["allowDamage", true, true];
[_obj, ["destroy BaseCore", {deletevehicle this; }]] remoteExec ["addAction",2];//_target
//function starten bekomme Geld für x objecte die dir gehören pro sekunde nicht senden
_fn_getMoney= {
_countMoney = 0;
{
if((_x distance player) < 200)then {
	if((_x getVariable["ownerUID",""]) == (getPlayerUID player))then{
		_countMoney = _countMoney +1;
	}
}
}forEach (allMissionObjects"ALL");
player setvariable["cmoney", (player getVariable["cmoney",0]) + (_countMoney *10),false];
};


//create marker
_group = createGroup civilian;
_dummyUnit = (_group) createUnit ["RU_Pilot", [0,0,0], [], 0, "NONE"]; 
[_dummyUnit] join _group;
_nic = [nil, _dummyUnit, "per", rHideobject, true] call RE; 
_dummyUnit attachTo [_currObject, [0,0,0]];
_dummyUnit setVariable ["name",name player, true];

waitUntil {call _fn_getMoney;sleep 1;!alive _obj};
deletevehicle _dummyUnit;
//beende wenn Object zerstört ist oder eingenommen