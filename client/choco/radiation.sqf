private["_dmg","_delay","_dist","_mrkrpos"];
	_dmg = 0.02; // 0.01 = 2% damage of HP
	_totalDmg = 0;
	_delay = 1; //delay in seconds  between damage
	_dist = 4500; //distance from marker where damage ticker starts
	_mrkrpos= [5783.792,10268.209,0];
	_resistance= {
_var1= player getVariable["bmoney", 0]; 
_var2= player getVariable["animalpoints", 0]; 
_var3= player getVariable["basebuilder", 0]; 
_endvar = (_var1 + _var2 + _var3) / 36000;
_endvar};
	waitUntil{sleep 1;player distance _mrkrpos < _dist};
	9999 cutText ["", "BLACK", 0.5];
	sleep 0.5; 
	9999 cutText ["", "BLACK IN"];
	9999 cutText ["", "BLACK IN"];
	player globalChat " CAUTION: You have entered the radiation zone, Georgetown got attacked with a Nuklearstrike, if you gonna forward make sure you have Resistence, otherwhise you will loose Health over time.";
	radiation_effect = [[true,3.2,-1.51,-1.85],true,[true,120,1],[true,60]] spawn radiationEffectStart;
	if ((call _resistance) > 0.32) then {_dmg =0.001};
	while {player distance _mrkrpos < _dist && (alive player)}
	do{
		_totalDmg= _totalDmg + _dmg;
		player setdamage (damage player) + _totalDmg; 
		sleep _delay;
	};
	//disable effects
	terminate radiation_effect;
	terminate ASHSCRIPT;
	vision_alias ppEffectEnable false;
	"filmGrain" ppEffectEnable false;
	_script= [0,0,0] execVM "AL_post\alias_screen.sqf";
	sound_ap = false;
	sleep 10;
	//restart
	[] spawn startRadiation;
 
