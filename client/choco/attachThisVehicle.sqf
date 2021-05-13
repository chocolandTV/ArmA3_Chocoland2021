if([] call fn_canTakeOwnership isEqualTo "") then{

    ATTACHING = true;
    ATTACHING_VEHICLE = _this select 3 select 0;
    _vehicle = (configFile >> "CfgVehicles" >> (typeOf ATTACHING_VEHICLE));
    _displayName = getText(_vehicle >> "displayName");
    player globalChat format["%1 attaching to....",_dispayName];
    }else{
     player globalChat format["%1 cannot be attached (crew, damage or Ownership)",_dispayName];
    };
