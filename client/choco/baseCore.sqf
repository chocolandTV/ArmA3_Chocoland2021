diag_log format ["####### basecore started ###### "];
if(!BASECORE)exitWith{
titleText ["<t color='#ffffff' size='3'>baseCore need 1 basebuilder Point to start. please buy some Objects.</t>", "PLAIN DOWN", -1, true, true];
};
if(!isNil"baseCoreObject") exitWith {titleText ["<t color='#ffffff' size='3'>baseCore is still alive.</t>", "PLAIN DOWN", -1, true, true];
 };
private ["_pos","_pos2","_objClass","_countMoney","_dummyUnit", "_group","_nic", "_moneyx","_name","_dir"];
_dir = getDir player;
_pos = getPosATL player;
_pos2 = [(_pos select 0)+6*sin(_dir),(_pos select 1)+6*cos(_dir),(_pos select 2)];
_name = name player;
_objClass = "Land_Device_assembled_F";
baseCoreObject = createVehicle [_objClass, _pos2, [], 0, "NONE"];
baseCoreObject allowDamage true;
baseCoreObject setVariable ["allowDamage", true, true];
baseCoreObject setVariable ["guid",str(getPlayerUID player),true];
baseCoreObject setPosATL _pos2;
titleText ["<t color='#ffffff' size='3'>Basecore spawned, collect money over time for every object near 100meter that belongs to you.</t>", "PLAIN DOWN", -1, true, true];

_fn_getMoney= {
	private _wallet = _this select 0;
	private ["_countMoney","_moneyx"];
	_countMoney= 1;
	{
		if((_x distance player) < 100 && (_x getVariable["ownerUID",""]) == (getPlayerUID player))then {
			_countMoney = _countMoney +1;	
		};
	}forEach (nearestObjects [position player, ["ALL"], 100]);

	_moneyx= (player getVariable["cmoney",0]) + _countMoney;
	player setvariable["cmoney",_moneyx,true];
	player setVariable["basebuilder", (player getVariable["basebuilder",0]) + 1,true];
	_wallet setVariable["wallet",_countMoney + (_wallet getVariable["wallet",0]),true];
};

//create marker
_group = createGroup civilian;
_dummyUnit = (_group) createUnit ["B_G_Survivor_F", [0,0,0], [], 0, "NONE"]; 
[_dummyUnit] join _group;
_dummyUnit hideObject true;
chocostring=  format["%1 hideObject true;",_dummyUnit];
publicVariable"chocostring";
_dummyUnit attachTo [baseCoreObject, [0,0,0]];
_dummyUnit setVariable ["name",_name, true];

waitUntil {[_dummyUnit] call _fn_getMoney;sleep 1;!alive baseCoreObject};
deletevehicle _dummyUnit;
baseCoreObject= nil;