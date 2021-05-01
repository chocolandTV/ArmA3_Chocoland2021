

[]spawn {//spawn BOUNTY unlocks
//unlock1 waituntil variable = 1   keepWeapon
waitUntil {(player getVariable["bmoney",0]) > 0};
titleText ["<t color='#ffffff' size='3'>unlocked : bounty - keep Weapon after death</t>","PLAIN DOWN", -1, true, true];
KEEPWEAPON = true;

//unlock2 waituntil variable = 1000 smartAmmo
waitUntil {(player getVariable["bmoney",0]) > 999};
titleText ["<t color='#ffffff' size='3'>unlocked : bounty - smart ammo buy (F3)</t>", "PLAIN DOWN", -1, true, true];
SMARTAMMO = true;

//unlock3 waituntil variable = 10000 satelliteCam
waitUntil {(player getVariable["bmoney",0]) > 9999};
titleText ["<t color='#ffffff' size='3'> unlocked : bounty - satellite Cam, check mousewheel</t>", "PLAIN DOWN", -1, true, true];
_pos = getPos player;
[_pos] call c_proving_ground_fnc_sattelite;

//unlock4 waituntil variable = 100 000 attachMenu
waitUntil {(player getVariable["bmoney",0]) > 99999};
titleText ["<t color='#ffffff' size='3'>unlocked : bounty - attach Menu, check mousewheel near vehicle</t>", "PLAIN DOWN", -1, true, true];
player addAction [("<img image='client\icons\r3f_loadin.paa' color='#06ef00'/> <t color='#06ef00'>" + "Attach this" + "</t>"), "client\choco\unlock\b_unlock4_attachMenu.sqf", nil, 6, true, true, "", "(cursorTarget isKindOf 'AllVehicles') || {cursorTarget isKindOf 'StaticWeapon'}"];
	
call b_unlock4;

//unlock5 waituntil variable = 1 000 000 InfiniteAmmo
waitUntil {(player getVariable["bmoney",0]) > 999999};
titleText ["<t color='#ffffff' size='3'>unlocked : bounty - Infinite Ammunition - check mousewheel - it cost money over time but you can turn off/ on</t>", "PLAIN DOWN", -1, true, true];
call b_unlock5;

};

[]spawn {//spawn ANIMALS unlocks

//unlock1 waituntil variable = 1 swimming
waitUntil {(player getVariable["animalpoints",0]) > 0};
titleText ["<t color='#ffffff' size='3'>unlocked : animal - swimming</t>", "PLAIN DOWN", -1, true, true];
call a_unlock1;

//unlock2 waituntil variable = 1000 bitePlayer
waitUntil {(player getVariable["animalpoints",0]) > 999};
titleText ["<t color='#ffffff' size='3'>unlocked : animal - bite action - press B - 2 sec cooldown</t>", "PLAIN DOWN", -1, true, true];
call a_unlock2;

//unlock3 waituntil variable = 10000 plantBomb
waitUntil {(player getVariable["animalpoints",0]) > 9999};
titleText ["<t color='#ffffff' size='3'>unlocked : animal - plant bombs - check mousewheel - allways 1 charge</t>", "PLAIN DOWN", -1, true, true];
call a_unlock3;

//unlock4 waituntil variable = 100 000 seagull
waitUntil {(player getVariable["animalpoints",0]) > 99999};
titleText ["<t color='#ffffff' size='3'>unlocked : animal - seagull - check mousewheel</t>", "PLAIN DOWN", -1, true, true];
call a_unlock4;

//unlock5 waituntil variable = 1 000 000 flyMode
waitUntil {(player getVariable["animalpoints",0]) > 999999};
titleText ["<t color='#ffffff' size='3'>unlocked : animal - flymode - check mousewheel -it cost money over time but you can turn off/ on - its also for player and vehicles</t>", "PLAIN DOWN", -1, true, true];
call a_unlock5;
};

[]spawn{//spawn BASEBUILDER unlocks
//unlock1 waituntil variable = 1 baseCore
waitUntil {(player getVariable["basebuilder",0]) > 0};
titleText ["<t color='#ffffff' size='3'>unlocked : basebuilder - baseCore - now you can activate the core to get basebuilder points and money</t>", "PLAIN DOWN", -1, true, true];
BASECORE = true;

//unlock2 waituntil variable = 1000 multiBuy
waitUntil {(player getVariable["basebuilder",0]) >  999};
titleText ["<t color='#ffffff' size='3'>unlocked : basebuilder - multibuy - now you can multibuy Objects and they will spawn infront of you and stack</t>", "PLAIN DOWN", -1, true, true];
MULTIBUY = true;

//unlock3 waituntil variable = 10000 auto-Flak
waitUntil {(player getVariable["basebuilder",0]) >  9999};
titleText ["<t color='#ffffff' size='3'>unlocked : basebuilder - auto Flak - a turret that will defend your base against enemies, vehicles helicopters, planes and jets too</t>", "PLAIN DOWN", -1, true, true];
call c_unlock3;

//unlock4 waituntil variable = 100 000 1ClickBase
waitUntil {(player getVariable["basebuilder",0]) >  99999};
titleText ["<t color='#ffffff' size='3'>unlocked : basebuilder - load or save and sell your created base - get money when other players buy your epic base, sell some cheap and some Expansive stuff</t>", "PLAIN DOWN", -1, true, true];
call c_unlock4;

//unlock5 waituntil variable = 1 000 000 invisible
waitUntil {(player getVariable["basebuilder",0]) >  999999};
titleText ["<t color='#ffffff' size='3'>unlocked : basebuilder - invisible - optional use 3rd person camera - have fun with direct speak or infritate some bases - it cost money over time but you can turn off/ on</t>", "PLAIN DOWN", -1, true, true];
call c_unlock5;
};