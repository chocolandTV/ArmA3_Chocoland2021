//  FILENAME moneyReward.sqf
private["_money", "_bounty","_killerbounty","_define"];
_define = _this select 0;
_killerbounty= _this select 1;
if(isNil"_killerbounty")then{ _killerbounty = 0};
_bounty = player getVariable["bmoney",0];
_killerbounty = _killerbounty *10;
_bounty = _bounty * 10;
_money=_bounty+ _killerbounty + _define;
[format ["You have obtained €%1", [_money] call fn_numbersText], 5] call mf_notify_client;
player setVariable["cmoney", _money + (player getVariable ["cmoney", 0]),true];
[player, +_money] call A3W_fnc_setCMoney;
player setVariable["bmoney",(player getVariable ["bmoney", 0]) +1 ,true];
if(!isNil "baseCoreObject")then{
    if(player distance baseCoreObject <= 100)then 
    {
        player setVariable["basebuilder", (player getVariable["basebuilder",0]) + 1,true];
    };
};

