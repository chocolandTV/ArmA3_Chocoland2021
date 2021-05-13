
private ["_perklevel", "_requirelvl","_var","_weapon", "_mag", "_price"];
_requirelvl = 1000;
_perklevel = player getVariable["bmoney",0];

if(_perklevel >= _requirelvl) then {

if( (player getVariable["cmoney",0]) > 500 )then{
_weapon = currentWeapon player;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
player addMagazine _mag;
_price  =500;
[player, -_price] call A3W_fnc_setCMoney;
player globalChat format["You bought %1 -ammunition for 500 $", _mag];
SMARTAMMO = true;
}else {player globalChat format["You dont have enough money for ammunition"];};
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough bountypoints, you still need %1 points.", _var];
};

