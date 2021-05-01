private ["_skin","_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
ClientSaveData={
_var1 = player getVariable ["cmoney", 0];
_var2 = player getVariable ["bmoney", 0];
_var3 = player getVariable["basebuilder", 0];
_var4 = player getVariable["animalpoints", 0];
 saveData = [_var1,_var2,_var3,_var4];
};
_skin=(_this select 0);
RESCUE= true;
call fn_savePlayerData;
call ClientSaveData;
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

   _string= format[" newUnit setVehicleInit ""this setVehicleVarName ""%1"" ""; %1 = this;", _ar select 7];
   compile _string;
    processInitCommands;

 [newUnit] join (_ar select 4);
removeSwitchableUnit newUnit;
camera_loop_active = false;
["A3W_camera_oneachFrame", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
 camera_loop_active =  true;
["A3W_camera_oneachFrame", "onEachFrame", camera_loop] call BIS_fnc_addStackedEventHandler;
sleep 0.3;
  deleteVehicle  _dummyUnit;
 oldUnit =_oldUnit;
 oldUnit setpos [1282.5133,529.53778,8.6060915];
 _nic = [nil, oldUnit, "per", rHideobject, true] call RE; 
sleep 0.3;
 if (_ar select 6) then { (group newUnit) selectLeader newUnit};

newUnit addweapon "ItemMap";
newUnit addweapon "ItemCompass";
newUnit addweapon "ItemWatch";
newUnit addEventHandler ["Respawn", { _this spawn onRespawn }];
newUnit addEventHandler ["Killed", onKilled];
//bombId = newUnit addAction[('<t color=''#FF33CC''>' + ('Blew Up') +  '</t>'),'server\functions\animalBomb.sqf'];
// add action Bite 10% dmg on player nearby
 walked =false;

newUnit globalChat" Reserve to Player MouseWheel action will come in 30 seconds";
diag_log format ["Player %1 is an Animal %2", name player, _skin];
//create Mission 
[getpos (newUnit),_skin]execVM"client\choco\animalMission.sqf";

sleep 30;revId = player addAction[('<t color=''#219eff''>' + ('Reverse to Player') +  '</t>'),'client\choco\reverseSkin.sqf'];
