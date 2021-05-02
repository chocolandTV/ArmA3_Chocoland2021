/*private["_dmg","_delay","_dist","_mrkrpos"];
	_dmg = 0.02; // 0.01 = 2% damage of HP
	_totalDmg = 0;
	_delay = 1; //delay in seconds  between damage
	_dist = 500; //distance from marker where damage ticker starts
	_mrkrpos= [653,11753,0];
	_resistance= {
//_var1= player getVariable["bmoney", 0]; 
//_var2= player getVariable["animalpoints", 0]; 
//_var3= player getVariable["basebuilder", 0]; 
_endvar = (_var1 + _var2 + _var3) / 180;
_endvar};
	waitUntil{sleep 1;player distance _mrkrpos < _dist};
	9999 cutText ["", "BLACK", 0.5];
	sleep 0.5; 
	9999 cutText ["", "BLACK IN"];
	9999 cutText ["", "BLACK IN"];
	player globalChat " CAUTION: the storm is comming, get in a house or vehicle, if you gonna forward make sure you have Resistence, otherwhise you will loose Health over time.";
	radiation_effect = [[true,3.2,-1.51,-1.85],true,[true,120,1],[true,60]] spawn radiationEffectStart;
	if ((call _resistance) > 0.32) then {_dmg =0.001};
	while {player distance _mrkrpos < _dist && (alive player)}
	do{
		_totalDmg= _totalDmg + _dmg;
		player setdamage (damage player) + _totalDmg; 
		sleep (_delay + call _resistance);
	};
	//disable effects
	terminate radiation_effect;
	terminate ASHSCRIPT;
	
	call fixRadiation;

	sound_ap = false;
	sleep 10;
	//restart
	[] spawn startMaldenStorm;

	

 */ 
 _sandStormDmg = {
 for "_i" from 1 to 60 do { 
		 {
		 _object=nearestObject [_x, "house"]; 
		 if( _object distance player >= 8)then {
				_x setDamage (damage _x) +0.05;
			};
		 } forEach playableUnits;
		 sleep 1;
		 };
 };
 //start new Malden Storm 
 while {true} do {
if (isServer) then {
	my_dust_storm_duration = 18000;
	publicVariable "my_dust_storm_duration";
	pause_between_dust_storm = 240 + random 600;
	publicVariable "my_dust_storm_duration";
};
waitUntil {(!isNil "my_dust_storm_duration") and (!isNil "pause_between_dust_storm")};
[ 
 parseText "<t size='2'>Warning Malden Storm incomming</t>", 
 parseText "2035 - climate crisis -  live from Chocoland - the Storm comes back to malden, gouverment cant handle this - the Weather coming up stormy and steamy like hell - Malden shelled again from border area, go into your House.all residents should immediately get into their houses and barricade them." 
] spawn BIS_fnc_AAN;
[] spawn {sleep 10; (uiNamespace getVariable "BIS_AAN") closeDisplay 1;};
[]spawn _sandStormDmg;
null = [340,60,true,true,false,0.3] execvm "AL_dust_storm\al_duststorm.sqf";

sleep (my_dust_storm_duration + pause_between_dust_storm);
};
