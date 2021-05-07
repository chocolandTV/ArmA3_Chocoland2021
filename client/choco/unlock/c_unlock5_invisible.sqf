private ["_perklevel", "_requirelvl","_var"];

_disableInvisible= {
objMYPlayer = (vehicle player);
publicVariable "objMYPlayer";
sleep 0.1;

_strExecCode = "if (isnil ("bInvisibleOn")) then {objMYPlayer hideObject false;};";

player setVehicleInit _strExecCode;
processInitCommands;
clearVehicleInit player;
bInvisibleOn = false;
hint "You are now Visible (OFF).";
_strExecCode = nil;
};
_requirelvl = 1000000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel > _requirelvl) then {
//Invisible Script
if (isnil ("bInvisibleOn")) then 
{
bInvisibleOn = false;
};

if (!bInvisibleOn) then
{
objMYPlayer = (vehicle player);
publicVariable "objMYPlayer";


_strExecCode = "if (isnil ("bInvisibleOn")) then {objMYPlayer hideObject true;};";

player setVehicleInit _strExecCode;
processInitCommands;
clearVehicleInit player;	
bInvisibleOn = true;
hint "Your are now Invisible (ON), but i cost 1 Basebuilder point a second.";
_strExecCode = nil;
while{bInvisibleOn} do {
     sleep 1; 
     player setVariable["basebuilder",(player getVariable["basebuilder",0]) - 1,true];
     if((player getVariable["basebuilder",0]) < 1000000)then {
        bInvisibleOn= false;
        call _disableInvisible;
        };
    };

}
else
{
objMYPlayer = (vehicle player);
publicVariable "objMYPlayer";
sleep 0.1;

_strExecCode = "if (isnil ("bInvisibleOn")) then {objMYPlayer hideObject false;};";

player setVehicleInit _strExecCode;
processInitCommands;
clearVehicleInit player;
bInvisibleOn = false;
hint "You are now Visible (OFF).";
_strExecCode = nil;
};

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

