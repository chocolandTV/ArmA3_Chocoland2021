MALDENSTORMENABLED = true;

while {MALDENSTORMENABLED} do {
	if (isServer) then {
		StormTime=0;
		randomize = floor (random 3600);
		pause_between_storm = 3600;
		StormTime = randomize + pause_between_storm;
		StormTime = StormTime + (floor serverTime);
		missionNamespace setVariable ["StormTime",StormTime];
		diag_log format ["####### Choco Server MaldenStorm wait %1 ######",pause_between_storm + randomize];
		sleep (pause_between_storm + randomize);

		if (count allPlayers > 0 )then 
			{
			chocoString ="[]spawn startMaldenStorm";
			publicVariable"chocoString";
			null = [340,60,true,true,false,0.3] execvm "AL_dust_storm\al_duststorm.sqf";
			};
	};
};