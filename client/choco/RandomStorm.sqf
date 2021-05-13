
 SERVERSPAWNING = true;
 while {SERVERSPAWNING} do
{ 
	_random = floor (random 3600);
	_randomStormTime= floor (random 600);
	sleep _random;

	al_duststorm_on= true;
	[] execVM "AL_dust_storm\alias_duststorm_effect.sqf";
	
	sleep _randomStormTime;
	al_duststorm_on = false;
};



