 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
#include "dialog\player_sys.sqf";
//if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
if(dialog) exitwith{};

disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue"];

_playerDialog = createDialog "playerSettings";

_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_moneytext = _Dialog displayCtrl money_text;
_mvalue = _Dialog displayCtrl money_value;
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_groupButton = _Dialog displayCtrl groupButton;
_foodtext ctrlSettext format["Animalpoints : %1 ",[player getVariable ["animalpoints", 0]] call fn_numbersText];
_watertext ctrlSetText format["Basebuilderpoints  : %1 ",[player getVariable ["basebuilder", 0]] call fn_numbersText];
_moneytext ctrlSetText format["Bountyoints : %1", [player getVariable ["bmoney", 0]] call fn_numbersText];

{
	_mvalue lbSetData [_mvalue lbAdd format ["€%1", [_x] call fn_numbersText], str _x];
} forEach [5000, 10000, 25000, 50000, 100000, 250000, 1000000];

[] spawn
{
	disableSerialization;
	_dialog = findDisplay playersys_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};