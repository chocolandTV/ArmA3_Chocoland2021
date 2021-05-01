private["_animal"];
_animal = _this select 0;
_pos = getPosATL _animal;
_bomb = "R_230mm_fly" createVehicle _pos;
_bomb setposATL _pos;