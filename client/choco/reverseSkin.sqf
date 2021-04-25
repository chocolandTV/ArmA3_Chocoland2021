private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
_nic = [nil, oldUnit, "per", rHideobject, false] call RE; 
_ar = [weapons oldUnit, magazines oldUnit, rank oldUnit, score oldUnit, group oldUnit, getPos oldUnit, (leader oldUnit) == oldUnit, vehicleVarName oldUnit];
 
 _group = group oldUnit;
 [oldUnit] join _group;
 setPlayable oldUnit;
 addSwitchableUnit oldUnit;
 selectplayer oldUnit;
sleep 1;
if (_ar select 7 != "") then {
    oldUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [oldUnit] join (_ar select 4);
removeSwitchableUnit newUnit;
 
sleep 1;
deleteVehicle newUnit; // Might have to remote execute this to be successfull in MP
 
sleep 1;
 if (_ar select 6) then { (group oldUnit) selectLeader oldUnit};
 
player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";

player setskill 0;
{player disableAI _x} foreach ["move","anim","target","autotarget"];

player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];
player setVariable ["BIS_noCoreConversations", true];
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";
player addrating 1000000;
oldunit = nil;
player switchMove "amovpknlmstpsraswpstdnon_gear";
call fn_requestPlayerData;
waitUntil {!isNil "playerData_loaded"};
diag_log format ["Player %1 is back to normal from Animal", name player];