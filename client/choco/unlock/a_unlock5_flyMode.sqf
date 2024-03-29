
private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 10000;
_perklevel = player getVariable["animalpoints",0];

if(_perklevel >= _requirelvl) then {

forwardAndBackward = 4; 
leftAndRight = 2;     
upAndDown = 5;         
distanceFromGround = 1; 
hovering = nil;
hoverPos = nil;


move_forward =
{
        if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
        {
_vehicle = (vehicle player);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 0.4; comment "Added speed";
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+
(cos _dir*_speed),0.4];
        };
};

move_left =
{
        if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
        {
            _leftDirection = getdir (vehicle player);
            (vehicle player) setdir (_leftDirection) - leftAndRight;
        };
};

move_backward =
{
        if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
        {
_vehicle = (vehicle player);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = -0.4; comment "Added speed";
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+
(cos _dir*_speed),0.4];
        };
};

move_right =
{
        if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
        {
            _rightDirection = getdir (vehicle player);
            (vehicle player) setdir (_rightDirection) + leftAndRight;
            player setVariable["lastPos",1];player setVariable["lastPos",[]];
        };
};

move_up =
{
    if ((getPosATL (vehicle player) select 2) < distanceFromGround) then
    {
        //player setVariable["dayz_isSwimming",true,false];
        //player playMoveNow "AswmPercMrunSnonWnonDf_AswmPercMstpSnonWnonDnon"
    };
    
_vehicle = (vehicle player);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 3; comment "Added speed";
_vehicle setVelocity [(_vel select 0),(_vel select 1),4];
};

move_down =
{
        if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
        {
           _vehicle = (vehicle player);
            _forwardCurrentDirection = getdir (vehicle player);
            _forwardCurrentPosition = getPosATL (vehicle player);
            (vehicle player) setdir _forwardCurrentDirection;
            _vehicle setVelocity [0,0,-4];
        };
};

toggle_hover =
{
    if (isnil "hovering") then
    {
        hovering = true;
        titleText ["Now hovering!","PLAIN DOWN"]; titleFadeOut 4;
        hoverPos = getPosATL (vehicle player);
    }
    else
    {
        hovering = nil;
        titleText ["No longer hovering!","PLAIN DOWN"]; titleFadeOut 4;
        //hoverPos = nil;
    };
};

if (isnil "iBeFlying") then 
{
    titleText ["Press 'spacebar' to toggle hover. And then Q for up and Y/Z for Down","PLAIN DOWN"]; titleFadeOut 4;
    iBeFlying = true;
    keyForward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 17) then {call move_forward;}"];     //W - Forward
    keyLeft = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 30) then {call move_left;}"];         //A - Left
    keyBackward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 31) then {call move_backward;}"];     //S - Backward
    keyRight = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 32) then {call move_right;}"];         //D - Right
    keyUp = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 16) then {call move_up;}"];         //Q - Up
    keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 44) then {call move_down;}"];         //Z - Down
    keyHover = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 33) then {call toggle_hover;}"];     //SpaceBar - Toggle Hover
}
else
{
    titleText ["Going Down!","PLAIN DOWN"]; titleFadeOut 4;
    iBeFlying = nil;
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyForward];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyLeft];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyBackward];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyRight];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyUp];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDown];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyHover];
};

while {iBeFlying} do
{
    if (hovering) then
    {
(vehicle player) setvelocity [0,0,0.2];
    };
};

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough animalpoints, you still need %1 points.", _var];
};
