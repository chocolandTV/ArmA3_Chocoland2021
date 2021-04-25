private ["_skin","_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];

_skin=typeOf (_this select 0);
if(isNil _skin)then { _skin = typeOf (_this select 1);};
RESCUE= true;
call fn_savePlayerData;
skinText = typeOf(player);
_oldUnit = player;
_type = _skin;
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
_dummyGroup = createGroup (side _oldUnit);
_dummyUnit = (_ar select 4) createUnit ["Fin_ocherwhite_F", [0, 0, 0], [], 0, "NONE"]; 
[_oldUnit] join _dummyGroup;
newUnit = _dummyGroup createUnit [_skin, _ar select 5, [], 0, "NONE"];
sleep 0.3;
setPlayable newUnit;
addSwitchableUnit newUnit;
selectPlayer newUnit;
newUnit setRank (_ar select 2);
newUnit addScore (_ar select 3);

sleep 0.3;

    newUnit setVehicleInit format["this setVehicleVarName ""%1""; %1 = this;", _ar select 7];
    processInitCommands;

 [newUnit] join (_ar select 4);
removeSwitchableUnit newUnit;
 
sleep 0.3;
  deleteVehicle  _dummyUnit;
 oldUnit =_oldUnit;
 oldUnit setpos [1282.5133,529.53778,8.6060915];
 _nic = [nil, oldUnit, "per", rHideobject, true] call RE; 
sleep 0.3;
 if (_ar select 6) then { (group newUnit) selectLeader newUnit};

player addweapon "ItemMap";
player addweapon "ItemCompass";
newUnit addweapon "ItemWatch";
player addEventHandler ["Respawn", { _this spawn onRespawn }];
player addEventHandler ["Killed", onKilled];
//bombId = player addAction[('<t color=''#FF33CC''>' + ('Blew Up') +  '</t>'),'client\chocofunc\animalbomb.sqf'];
// add action Bite 10% dmg on player nearby
 walked =false;

chocoland globalChat" Reserve to Player MouseWheel action will come in 30 seconds";
diag_log format ["Player %1 is an Animal %2", name player, _skin];
//create Mission 
[getpos player]execVM"client\choco\animalMission.sqf";

sleep 30;revId = player addAction[('<t color=''#219eff''>' + ('Reverse to Player') +  '</t>'),'client\choco\reverseSkin.sqf'];
