private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 100000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel > _requirelvl) then {
player addAction [("<img image='client\icons\r3f_loadin.paa' color='#06ef00'/> <t color='#06ef00'>" + "Save my Base (100m)" + "</t>"), "client\choco\unlock\b_unlock4_attachMenu.sqf", nil, 6, true, true, "", "(cursorTarget isKindOf 'AllVehicles') || (cursorTarget isKindOf 'StaticWeapon')"];

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

