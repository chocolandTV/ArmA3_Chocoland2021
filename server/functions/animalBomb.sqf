_private=["_player"];
_player = _this select 0;
_pos = getPosATL _player;
_bomb = "R_230mm_fly" createVehicle _pos;
_bomb setposATL _pos;