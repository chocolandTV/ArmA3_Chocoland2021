private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 100000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel >= _requirelvl) then {
saveBaseMarket = true;
}else{
_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

