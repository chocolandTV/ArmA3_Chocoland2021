
private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 10000;
_perklevel = player getVariable["animalpoints",0];

if(_perklevel >= _requirelvl) then {
ANIAMLBOMB = true;
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough animalpoints, you still need %1 points.", _var];
};

