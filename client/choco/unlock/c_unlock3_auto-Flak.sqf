
BFG = "B_AAA_System_01_F" createVehicle position player;
_ma2 = group player;
_m1 = _ma2 createUnit ["US_Soldier_Pilot_EP1",position player, [], 0, "form"];
_m1 setRank "COLONEL";
_m1 assignAsGunner BFG;
