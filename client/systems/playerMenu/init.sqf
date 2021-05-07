 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
#include "dialog\player_sys.sqf";
//if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
if(dialog) exitwith{};

disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue","_resistance","_resi","_var1","_var2","_var3"];

_playerDialog = createDialog "playerSettings";

_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_moneytext = _Dialog displayCtrl money_text;
_mvalue = _Dialog displayCtrl money_value;
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_resistance = _Dialog displayCtrl view_range_text;
_groupButton = _Dialog displayCtrl groupButton;
//get unlock buttons
_bountyu1 = _Dialog displayCtrl bountyu1;
_bountyu2 = _Dialog displayCtrl bountyu2;
_bountyu3= _Dialog displayCtrl bountyu3;
_bountyu4 = _Dialog displayCtrl bountyu4;
_bountyu5 = _Dialog displayCtrl bountyu5;
_basebuilderu1 = _Dialog displayCtrl basebuilderu1;
_basebuilderu2 = _Dialog displayCtrl basebuilderu2;
_basebuilderu3 = _Dialog displayCtrl basebuilderu3;
_basebuilderu4 = _Dialog displayCtrl basebuilderu4;
_basebuilderu5 = _Dialog displayCtrl basebuilderu5;
_animalu1 = _Dialog displayCtrl animalu1;
_animalu2 = _Dialog displayCtrl animalu2;
_animalu3 = _Dialog displayCtrl animalu3;
_animalu4 = _Dialog displayCtrl animalu4;
_animalu5 = _Dialog displayCtrl animalu5;
//endunlockButtons
_bountyV = player getVariable["bmoney",0];
_basebuilderV= player getVariable["basebuilder",0];
_animalV = player getVariable["animalpoints",0];
//if button on
if(_bountyV < 1000000)then {
	_bountyu5 ctrlSetText "1.000.000";
	if(_bountyV < 100000)then {
		_bountyu4 ctrlSetText "100.000";
		if(_bountyV < 10000)then {
			_bountyu3 ctrlSetText "10.000";
			if(_bountyV < 1000)then {
				_bountyu2 ctrlSetText "1.000";
				if(_bountyV < 1)then {
					_bountyu1 ctrlSetText "1";
				};
			};
		};
	};
};
if(_animalV < 1000000)then {
	_animalu5 ctrlSetText "1.000.000";
	if(_animalV < 100000)then {
		_animalu4 ctrlSetText "100.000";
		if(_animalV < 10000)then {
			_animalu3 ctrlSetText "10.000";
			if(_animalV < 1000)then {
				_animalu2 ctrlSetText "1.000";
				if(_animalV < 1)then {
					_animalu1 ctrlSetText "1";
				};
			};
		};
	};
};
if(_basebuilderV < 1000000)then {
	_basebuilderu5 ctrlSetText "1.000.000";
	if(_basebuilderV < 100000)then {
		_basebuilderu4 ctrlSetText "100.000";
		if(_basebuilderV < 10000)then {
			_basebuilderu3 ctrlSetText "10.000";
			if(_basebuilderV < 1000)then {
				_basebuilderu2 ctrlSetText "1.000";
				if(_basebuilderV < 1)then {
					_basebuilderu1 ctrlSetText "1";
				};
			};
		};
	};
};
_foodtext ctrlSettext format["Animal points : %1 ",[player getVariable ["animalpoints", 0]] call fn_numbersText];
_watertext ctrlSetText format["Basebuilder points  : %1 ",[player getVariable ["basebuilder", 0]] call fn_numbersText];
_moneytext ctrlSetText format["Bounty points : %1", [player getVariable ["bmoney", 0]] call fn_numbersText];
_var1 = player getVariable ["bmoney", 0];
_var2 =  player getVariable ["animalpoints", 0];
_var3 =  player getVariable ["basebuilder", 0];
_resi = (_var1 + _var2 + _var3)  / 180;
_resistance ctrlSetText format["Resistance points : %1",[_resi] call fn_numbersText];
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
