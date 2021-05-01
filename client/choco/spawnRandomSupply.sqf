private ["_obj","_pos","_para","_objectType"];
_objectType = _this select 0;
_pos = _this select 1;
diag_log format ["Supply Spawning ID %1",_objectType];
_pos set [2, 1000];

_obj = createVehicle [(_this select 0), _pos, [], 0, "NONE"];
_obj allowdamage false;
_obj setPosATL _pos;
_para = createVehicle ["I_Parachute_02_F", _pos, [], 0, ""];
_para setPosATL _pos;
_obj attachTo [_para,[0,0,0]]; 

while {(getPos _obj select 2) > 2 &&(alive _para)&&(alive _obj)}
do{
_para setVectorUp [0,0,1];
_para setVelocity [0, 0, ((velocity _para) select 2)*1.2];
sleep 0.1;
};
deTach _obj;
sleep 2;

deleteVehicle _para;
_obj setDamage 0;
_obj allowdamage true;