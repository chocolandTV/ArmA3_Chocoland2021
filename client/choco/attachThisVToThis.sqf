// set Vehicle 2

ATTACHING_VEHICLE_TWO = _this select 3 select 0;

_vehicle = (configFile >> "CfgVehicles" >> (typeOf ATTACHING_VEHICLE));
_displayName = getText(_vehicle >> "displayName");

player globalChat format["%1 attaching to....",_dispayName];
_vehicle2 = (configFile >> "CfgVehicles" >> (typeOf ATTACHING_VEHICLE_TWO));
_displayName2 = getText(_vehicle >> "displayName");

player globalChat format["Attaching %1 to %2, use W, A, S and D to align, SPACE to detach and ESC to Finish.",_dispayName, _displayName2];
//attach with default
ATTACHING_VEHICLE_TWO attachTo [ATTACHING_VEHICLE, [ATTACH_X,ATTACH_Y,0]];
// use W A S D to change Attach scale and ESC 

while{ATTACHING} do {
    ATTACHING_VEHICLE_TWO attachTo [ATTACHING_VEHICLE, [ATTACH_X,ATTACH_Y,0]];
    hint format["Attaching %1 to %2, use W, A, S and D to align, SPACE to detach and ESC to Finish.",_dispayName, _displayName2];
    sleep 1;
};
ATTACH_X = 0;
ATTACH_Y = 0;