
private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 100000;
_perklevel = player getVariable["bmoney",0];

if(_perklevel > _requirelvl) then {
 // create addaction
 player addAction [("<img image='client\icons\r3f_loadin.paa' color='#06ef00'/> <t color='#06ef00'>" + "Attach this" + "</t>"), "client\choco\unlock\b_unlock4_attachMenu.sqf", nil, 6, true, true, "", "(cursorTarget isKindOf 'AllVehicles') || (cursorTarget isKindOf 'StaticWeapon')"];
 player addAction [("<img image='client\icons\r3f_loadin.paa' color='#06ef00'/> <t color='#06ef00'>" + "to this Object" + "</t>"), "client\choco\unlock\b_unlock4_attachMenu.sqf", nil, 6, true, true, "", "(cursorTarget isKindOf 'AllVehicles') || (cursorTarget isKindOf 'StaticWeapon')"];

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough bountypoints, you still need %1 points.", _var];
};

