//  FILENAME moneyReward.sqf
	
diag_log format ["####### enter MoneyReward script ######"];
private["_money", "_bounty"];
_bounty =  player getVariable["bmoney",1];
_money = _bounty *100;
if((_this select 0) == "Choco")then {_money = _money +10000;};
[format ["You have obtained €%1", [_money] call fn_numbersText], 5] call mf_notify_client;
player setVariable["cmoney", _money + (player getVariable ["cmoney", 0]),true];
[player, +_money] call A3W_fnc_setCMoney;
player setVariable["bmoney",(player getVariable ["bmoney", 0]) +1 ,true];
	
diag_log format ["####### end money Reward SCript player get %1 € ######",_money];