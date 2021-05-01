diag_log format ["####### basecore started ###### "];
if(!BASECORE)exitWith{
titleText ["<t color='#ffffff' size='3'>baseCore need 1 basebuilder Point to start. please buy some Objects.</t>", "PLAIN DOWN", -1, true, true];

};

private ["_pos","_objClass","_countMoney","_dummyUnit", "_group","_nic", "_moneyx"];
_pos = getPosATL player;
_objClass = "Land_Device_assembled_F";
baseCoreObject = createVehicle [_objClass, _pos, [], 0, "NONE"];
baseCoreObject allowDamage true;
baseCoreObject setVariable ["allowDamage", true, true];
[baseCoreObject, ["destroy BaseCore", {deletevehicle this; }]] remoteExec ["addAction",2];//_target
baseCoreObject setPosATL _pos;
//function starten bekomme Geld für x objecte die dir gehören pro sekunde nicht senden
_fn_getMoney= {
_countMoney = 0;
{
if((_x distance player) < 200 && (_x getVariable["ownerUID",""]) == (getPlayerUID player))then {
	_countMoney = _countMoney +1;	
};
}forEach (nearestObjects [position player, ["ALL"], 100]);
_moneyx= (player getVariable["cmoney",0]) + (_countMoney *10);
player setvariable["cmoney",_moneyx,false];
player setVariable["basebuilder", (player getVariable["basebuilder",0]) + 1,true];
};


//create marker
_group = createGroup civilian;
_dummyUnit = (_group) createUnit ["RU_Pilot", [0,0,0], [], 0, "NONE"]; 
[_dummyUnit] join _group;
_nic = [nil, _dummyUnit, "per", rHideobject, true] call RE; 
_dummyUnit attachTo [baseCoreObject, [0,0,0]];
_dummyUnit setVariable ["name",name player, true];

waitUntil {call _fn_getMoney;sleep 1;!alive baseCoreObject};
deletevehicle _dummyUnit;
//beende wenn Object zerstört ist oder eingenommen