
private ["_perklevel", "_requirelvl","_var","_weapon", "_mag", "_price"];
_requirelvl = 1000;
_perklevel = player getVariable["bmoney",0];

if(_perklevel > _requirelvl) then {

_weapon = currentWeapon player;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
player addMagazine _mag;
_price  =500;
_playerMoney = player getVariable ["cmoney", 0];
player setVariable ["cmoney", _playerMoney - _price, true];
[player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;
SMARTAMMO = true;

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough bountypoints, you still need %1 points.", _var];
};

