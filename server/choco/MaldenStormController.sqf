MALDENSTORMENABLED = true;

while {MALDENSTORMENABLED} do {
	if (isServer) then {
		
		randomize = floor (random 3600);
		pause_between_storm = 3600;
		StormTime = randomize + pause_between_storm;
		StormTime = StormTime + (floor serverTime);
		missionNamespace setVariable "StormTime";
		diag_log format ["####### Choco Server MaldenStorm wait %1 ######",pause_between_storm + randomize];
		sleep (pause_between_storm + randomize);
		if (count playableUnits > 0 )then 
			{
			chocoString ="call startMaldenStorm";
			publicVariable"chocoString";
			null = [340,60,true,true,false,0.3] call startStormEffect;
			};
	};
};