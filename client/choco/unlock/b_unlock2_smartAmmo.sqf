private["_weapon", "_mag", "_price"];
_weapon = currentWeapon (vehicle player);
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
(vehicle player) addMagazine _mag;

// decrease money 500
_price  =500;
_playerMoney = player getVariable ["cmoney", 0];
_player setVariable ["cmoney", _playerMoney - _price, true];
[_player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;
