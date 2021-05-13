private ["_skin","_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
ClientSaveData={
_var1 = player getVariable ["cmoney", 0];
_var2 = player getVariable ["bmoney", 0];
_var3 = player getVariable["basebuilder", 0];
_var4 = player getVariable["animalpoints", 0];
 saveData = [_var1,_var2,_var3,_var4];
};
ClientLoadData= {
player setVariable ["cmoney",(saveData select 0),true];
player setVariable ["bmoney",(saveData select 1),true];
player setVariable ["basebuilder",(saveData select 2),true];
player setVariable ["animalpoints",(saveData select 3),true];
};
_skin=(_this select 0);
ANIMALMODE= true;

0 call ClientSaveData;
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

_pos = (getPosATL newUnit);

[] execVM "addons\camera\functions.sqf";
sleep 0.3;
  deleteVehicle  _dummyUnit;
 oldUnit =_oldUnit;
 oldUnit setpos [1282.5133,529.53778,8.6060915];
 oldUnit hideObject true;
chocostring=  format["%1 hideObject true;",oldUnit];
publicVariable"chocostring";
sleep 0.3;
 if (_ar select 6) then { (group newUnit) selectLeader newUnit};

newUnit addweapon "ItemMap";
newUnit addweapon "ItemCompass";
newUnit addweapon "ItemWatch";
0 call ClientLoadData; 
player addEventHandler ["Killed", {
player setDamage 0;
_pos = getMarkerPos "RespawnRandom";
_playerPos =[[[_pos, 6000]],["water"]] call BIS_fnc_randomPos;

player setPos _playerPos;
}];

newUnit globalChat" Reserve to Player MouseWheel action will come in 30 seconds";
diag_log format ["Player %1 is an Animal %2", name player, _skin];
//create Mission 
[getpos (newUnit),_skin]execVM"client\choco\animalMission.sqf";
waitUntil {player setVariable["animalpoints", (player getVariable["animalpoints",0]) + 1,true]; sleep 1;!alive newUnit};