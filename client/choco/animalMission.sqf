private ["_pos", "_objClass", "_obj", "_string","_animalGroup","_moneyReward","_dummyUnit","_nic"];
_animalBomb = {
_private=["_player"];
_player = _this;
_pos = getPos _player;
_bomb = "ModuleOrdnanceHowitzer_F_ammo" createVehicle _pos;
_bomb setposATL _pos;
};

_animalGroup = createGroup Civilian; 
_pos =_this select 0;
_objClass =_this select 1;
_pos = [[[_pos,500]],[]] call BIS_fnc_randomPos;
_obj = _animalGroup createUnit [_objClass, _pos,[],0,"NONE"];
_obj addEventHandler ["killed", {[this]call _animalBomb;}];
_obj setPos _pos;
// create group tag and message
_moneyReward = floor(player distance _obj);
_moneyReward = _moneyReward + 10;
_dummyUnit = (group player) createUnit ["RU_Pilot", [0,0,0], [], 0, "NONE"]; 
[_dummyUnit] join (group player);
_nic = [nil, _dummyUnit, "per", rHideobject, true] call RE; 
_dummyUnit attachTo [_obj, [0,0,0]];
_dummyUnit setVariable ["name",name player, true];
titleText ["***********<br/><t color='#ff0000' size='2'>find the animal near this location</t><br/>***********<br/> there is a marker", "PLAIN DOWN", -1, true, true];

// add action for type to player
_string = format[" [_obj, [""catch Animal"", {[%1] call becomeAnimal; }]] remoteExec [""addAction"",2];",_objClass];
call compile _string;
waitUntil{player distance _obj < 2};
 // waituntil player is on unit
 deleteVehicle _dummyUnit;
 
 // reward player distance unit    and animalpoints ++
 player globalChat format["great, you found the animal you got %1 animalpoints", _moneyReward];
 player setVariable ["animalpoints", (player getVariable["animalpoints",0]) + _moneyReward,true];
