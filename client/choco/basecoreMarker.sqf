
private["_function_marker","_cores"];
setGroupIconsVisible [true, true];
_function_marker = {
     _cores = nearestObjects [player, ["RU_Pilot"], 100000];
     {
     clearGroupIcons group _x;(group _x) addGroupIcon ["x_art"];
     (group _x) setGroupIconParams [[0, 1, 0, 1],format ["%1`s basecore",_x getvariable["name","noName"]], 0.4, true];
     }foreach _cores;
};

while{true} do {
[]call _function_marker;
sleep 60;};
