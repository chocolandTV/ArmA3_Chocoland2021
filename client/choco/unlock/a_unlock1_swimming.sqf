private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 1;
_perklevel = player getVariable["animalpoints",0];

if(_perklevel > _requirelvl) then {
ANIMALSWIMMING = true;

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough animalpoints, you still need %1 points.", _var];
};
