
 _sandStormDmg = {
private["_var1","_var2","_var3","_endvar"];
params ["_time"];
_var1= (player getVariable["bmoney", 0]) / 50000; 
_var2= (player getVariable["animalpoints", 0]) / 50000; 
_var3= (player getVariable["basebuilder", 0]) / 50000; 
_endvar = (_var1 + _var2 + _var3);
 for "_i" from 1 to 60 do { 
		
		 _object=nearestObject [player, "house"]; 
		 if( _object distance player >= 8)then {
				player setDamage (damage player) +0.05;
			};
		
		 sleep _endvar + (0.5);
		 };
 };
 //start new Malden Storm 
hint parseText format	["<t color='#FFFFFF' shadow='2' size='1.75'>Storm incoming - get inside</t><br/>" +
"<t color='#FFFFFF'>------------------------------</t><br/>" +
"<t color='#FFFFFF' size='1.0'>because of the climate crisis, the storm comes back to Malden. The gouverment cant handle, get inside.</t>"];
titleText ["***********<br/><t color='#ff0000' size='2'>Storm incoming - get inside!</t><br/>because of the climate crisis, the storm comes back to Malden. The gouverment cant handle, get inside.", "PLAIN DOWN", -1, true, true];

sleep 10;

[] execVM "AL_dust_storm\alias_duststorm_effect.sqf";
0 call _sandStormDmg;

