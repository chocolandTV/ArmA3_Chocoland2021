
private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 1;
_perklevel = player getVariable["bmoney",0];

if(_perklevel > _requirelvl) then {
KEEPWEAPON = true;
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough bountypoints, you still need %1 points.", _var];
};

