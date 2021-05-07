private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 1000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel > _requirelvl) then {
MULTIBUY = true;
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

