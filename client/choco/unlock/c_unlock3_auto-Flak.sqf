private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 10000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel >= _requirelvl) then {

_create={
_pos = _this select 0;
BFG = "B_AAA_System_01_F" createVehicle _pos;
_ma2 = group player;
_m1 = _ma2 createUnit ["US_Soldier_Pilot_EP1",_pos, [], 0, "form"];
_m1 setRank "COLONEL";
_m1 assignAsGunner BFG;
};
titleText ["***********<br/><t color='#ff0000' size='2'>Requesting AutoFlak on following coordinates!</t><br/>click to Spawn", "PLAIN DOWN", -1, true, true];
openMap true;
ClickOnMapEH = addMissionEventHandler ["MapSingleClick", {[(_this select 1)] spawn _create;openMap false;}];
waitUntil {!visibleMap}; // Wait until map is closed, either by ESC/M or map click
removeMissionEventHandler ["MapSingleClick",ClickOnMapEH]; // removes eventhandler so it doesn´t stack and spawn more than one vehicle
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

