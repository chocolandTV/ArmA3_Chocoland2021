// by ALIAS
// Dust Storm SCRIPT 

private ["_vizibility","stormsource","_x_dev","_y_dev"];

if (!isServer) exitWith {};

_direction_duststorm	= _this select 0;
_duration_duststorm		= _this select 1;
_effect_on_objects		= _this select 2;
_dust_wall				= _this select 3;
_lethal_wall			= _this select 4;
_vizibility				= _this select 5;

//hint str _direction_duststorm;

al_duststorm_on = true;
publicVariable "al_duststorm_on";

al_foglevel		= fog;
al_rainlevel	= rain;
al_thundlevel	= lightnings;
al_windlevel	= wind;
publicVariable "al_foglevel";
publicVariable "al_rainlevel";
publicVariable "al_thundlevel";
publicVariable "al_windlevel";

sleep 0.1;

[_duration_duststorm] spawn {
	x_duration_storm = _this select 0;
	sleep x_duration_storm;
	
	al_duststorm_on = false;
	publicVariable "al_duststorm_on";

// restaureaza parametri vreme
	60 setFog al_foglevel;
	60 setRain al_rainlevel;
	60 setLightnings al_thundlevel;
//	180 setOvercast al_overforecast;
	setWind [al_windlevel select 0, al_windlevel select 1, true];
	//forceWeatherChange;
};

[] spawn {
	while {al_duststorm_on} do {
		chocostring =" playSound ""bcg_wind"";";
		publicVariable"chocostring";
		sleep 67;
	};
};

[_vizibility] spawn {
	private ["_vizibility"];
	_vizibility = _this select 0;
	_ifog=0;
	while {_ifog < _vizibility} do {
		_ifog=_ifog+0.001; 0 setFog _ifog; sleep 0.01;
	};
};

chocostring= "call effectStorm;";
publicVariable"chocostring";

if (_dust_wall) then 
{
	_rand_pl = [] spawn huntStorm;
	waitUntil {scriptDone _rand_pl};
	_pozobcj = hunt_alias getRelPos [800,(_direction_duststorm-180)];
	stormsource = "Land_HelipadEmpty_F" createVehicle _pozobcj;
	stormsource setDir _direction_duststorm;//_alpha = getDir _sursa_storm;
	if ((_direction_duststorm>315)or(_direction_duststorm<45)) then {_x_dev=600; _y_dev = 60};
	if ((_direction_duststorm<225)or(_direction_duststorm>135)) then {_x_dev=600; _y_dev = 60};
	if ((_direction_duststorm<=135)&&(_direction_duststorm>=45)) then {_x_dev=60; _y_dev = 600};
	if ((_direction_duststorm>=225)&&(_direction_duststorm<=315)) then {_x_dev=60; _y_dev = 600};
	chocostring =format["[%1,%2,%3,%4]call dustWallStorm;",stormsource,_duration_duststorm,_x_dev,_y_dev];
	publicVariable="chocostring";
	[stormsource] spawn 
	{
		private ["stormsource_s"];
		stormsource_s = _this select 0;
		publicVariable"stormsource_s";
		while {al_duststorm_on} do 
		{
			chocostring= format["%1 say3D [""uragan_1"", 2000, 1, false, 0];", stormsource_s];
			publicVariable"chocostring";
			sleep 40;
		};
	};
	if (_lethal_wall) then {
	[stormsource,_x_dev,_y_dev] spawn lethalWallStorm; };
	[stormsource,_direction_duststorm] spawn {
	private ["stormsource","_direction_duststorm"];
	stormsource = _this select 0; _direction_duststorm = _this select 1;
	while {al_duststorm_on} do {stormsource setPos (stormsource getRelPos [10,_direction_duststorm]);sleep 5}};
};

// seteaza wind storm functie de directie
raport = 360/_direction_duststorm;
raport = round (raport * (10 ^ 2)) / (10 ^ 2);
if (raport >= 4) then {fctx = 1; fcty = 1;}	else {if (raport >= 2) then {fctx = 1; fcty = -1;}else { if (raport >=1.33) then {fctx = -1; fcty = -1;}else {fctx = -1; fcty = 1;};};};
if ((raport <= 2) and (raport >= 1.33)) then {fctx = -1; fcty = -1;};
_unx	= ((_direction_duststorm - floor (_direction_duststorm/90)*90))*fctx;
vx = floor (_unx * 0.6);
vy = (54 - vx)*fcty;
// mareste incremental vantul
inx = 0;
iny = 0;
incr = true;
incrx = false;
incry = false;
while {incr} do 
{
	sleep 0.01;
	if (inx < abs vx) then {inx = inx+0.1;} else {incrx = true};
	if (iny < abs vy) then {iny = iny+0.1} else {incry = true};
	if (incrx and incry) then {incr=false};
	winx = floor (inx*fctx/2);
	winy = floor (iny*fcty/2);
	setWind [winx,winy,true];
};

if (_effect_on_objects) then {

	while {al_duststorm_on} do {
		sleep 1;
		_rand_pl = []spawn huntStorm;
		waitUntil {scriptDone _rand_pl};

	// interval object blow
		//sleep 1;
		sleep 60+random 120;
		
		al_nearobjects = nearestObjects [hunt_alias,[],50];
		ar_obj_eligibl = [];
		
		{if((_x isKindOf "LandVehicle") or (_x isKindOf "Man") or (_x isKindOf "Air") or (_x isKindOf "Wreck")) then 
			{ar_obj_eligibl pushBack _x;};
		} foreach al_nearobjects;
		
		sleep 1;
		
		// alege obiect
		_blowobj= ar_obj_eligibl call BIS_fnc_selectRandom;

		//durata_rafala = 1+random 5;	sleep 30+random 120;
		sleep 1;
		[] spawn {
			_rafale = ["rafala_1","sandstorm","rafala_4_dr","rafala_5_st"] call BIS_fnc_selectRandom;
		chocostring = format[" playSound ""%1"";",_rafale];
		publicVariable"chocostring";
		};
		
		if (!isNull _blowobj) then {
			_xblow	= 0.1+random 5;
			_yblow	= 0.1+random 5;
	
			// creste viteza incremental
			_xx=0;
			_yy=0;
			
			while {(_xx< _xblow) or (_yy< _yblow)} do {
				_blowobj setvelocity [_xx*fctx,_yy*fcty,random -1];
				_xx = _xx + 0.01;
				_yy = _yy + 0.01;
				sleep 0.001;
			};
		
		};
	};
};

while {al_duststorm_on} do {
	_rafale = ["rafala_1","sandstorm","rafala_4_dr","rafala_5_st"] call BIS_fnc_selectRandom;
	chocostring = format[" playSound ""%1"";",_rafale];
	publicVariable"chocostring";
	sleep 60+random 120;
};
deleteVehicle stormsource;