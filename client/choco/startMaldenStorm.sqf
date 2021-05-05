
 _sandStormDmg = {

_var1= player getVariable["bmoney", 0]; 
_var2= player getVariable["animalpoints", 0]; 
_var3= player getVariable["basebuilder", 0]; 
_endvar = (_var1 + _var2 + _var3) / 1800;
 for "_i" from 1 to 60 do { 
		
		 _object=nearestObject [player, "house"]; 
		 if( _object distance player >= 8)then {
				player setDamage (damage player) +0.05;
			};
		
		 sleep _endvar + (0.5);
		 };
 };
 //start new Malden Storm 
[ 
 parseText "<t size='2'>Storm incoming - get inside</t>", 
 parseText "because of the climate crisis, the storm comes back to Malden. The gouverment cant handle, get inside. \\\\  12.048 deaths today" 
] spawn BIS_fnc_AAN;
sleep 10;
(uiNamespace getVariable "BIS_AAN") closeDisplay 1;
[]spawn _sandStormDmg;


