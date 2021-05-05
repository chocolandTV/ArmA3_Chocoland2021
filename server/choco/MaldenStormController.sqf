MALDENSTORMENABLED = true;

while {MALDENSTORMENABLED} do {
	if (isServer) then {
		
		randomize = random 3600;
		pause_between_storm = 3600;
		StormTime = serverTime + randomize + pause_between_storm;
		missionNamespace setVariable "StormTime";
		diag_log format ["####### Choco Server MaldenStorm wait %1 ######",pause_between_storm + randomize];
		sleep (pause_between_storm + randomize);
		chocoString ="call startMaldenStorm";
		publicVariable"chocoString";
		null = [340,60,true,true,false,0.3] call startStormEffect;
	};
};