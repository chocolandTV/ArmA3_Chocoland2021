private ["_basecore","_wallet", "_npc"];
_basecore = _this select 0;
 _npc = nearestObject [player, "B_G_Survivor_F"];
_wallet = _npc getVariable["wallet",1000];

if(alive _basecore && (_basecore getVariable["guid",""]) != str (getPlayerUID player))then {

// destroying basecore need 5 seconds
doaction = true;
[5] spawn chocoDoAction;
waitUntil{!doaction};
titleText ["<t color='#ffffff' size='3'>baseCore destroyed, you got some money.</t>", "PLAIN DOWN", -1, true, true];

// earn money Wallet value
[_wallet,0]call getMoneyReward;

// destroy basecore
_basecore setDamage 1;
}else{
    if(alive _basecore && (_basecore getVariable["guid",""]) == str (getPlayerUID player))then {
        doaction = true;
        [20] spawn chocoDoAction;
        waitUntil{!doaction};
        titleText ["<t color='#ffffff' size='3'>You destroyed your basecore, you got 10.000 back.</t>", "PLAIN DOWN", -1, true, true];
        [player, -10000] call A3W_fnc_setCMoney;
        [] spawn fn_savePlayerData;
        _basecore setDamage 1;
    };
};
