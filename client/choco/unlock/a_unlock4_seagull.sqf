private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 100000;
_perklevel = player getVariable["animalpoints",0];

if(_perklevel > _requirelvl) then {
cam = "seagull" camCreate (player modelToWorld [0,0,5]);
cam cameraEffect [ "FixedWithZoom", "back"];sleep 5;
cam cameraEffect [  "external", "top"]; cam camCommand "manual on";
SEAGULL = true;
player globalChat "Press ESC to go back to normal";
waituntil {!SEAGULL};
cam cameraEffect ["terminate", "back"]; camDestroy cam;
}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough animalpoints, you still need %1 points.", _var];
};
