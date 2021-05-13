dir=getdir player;
_pos = getposatl player;
 _pos = [(_pos select 0)+5*sin(dir),(_pos select 1)+5*cos(dir),(_pos select 2)];
 _grp = creategroup civilian;

 _spawn = _grp createunit ["Goat_random_F",_pos,[],0,"NONE"];  _spawn setPos _pos; 
_spawn attachto [spawn2,[0,-0.55,-1.2]];
 spawn2 = createVehicle["C_Quadbike_01_F",_pos,[], 0,"CAN_COLLIDE"];
 spawn2 setdir (getdir player);
 spawn2 setObjectTextureGlobal [0, ""];
 spawn2 setObjectTextureGlobal [1, ""];

 
 player moveindriver spawn2;
 player assignAsDriver spawn2;
/*
 Flare = "SmokeShell" createVehicle position vehicle player;Flare attachTo [vehicle player,[4,0,0]];
Flare1 = "Smokeshellyellow" createVehicle position vehicle player;Flare1 attachTo [vehicle player,[3,0,0]];
Flare2 = "Smokeshellgreen" createVehicle position vehicle player;Flare2 attachTo [vehicle player,[2,0,0]];
Flare3 = "Smokeshellblue" createVehicle position vehicle player;Flare3 attachTo [vehicle player,[1,0,0]];
Flare4 = "Smokeshellpurple" createVehicle position vehicle player;Flare4 attachTo [vehicle player,[0,0,0]];
Flare5 = "Smokeshellred" createVehicle position vehicle player;Flare5 attachTo [vehicle player,[-1.5,0,0]];
Flare6 = "Smokeshellorange" createVehicle position vehicle player;Flare6 attachTo [vehicle player,[-2,0,0]];
Flare7 = "SmokeShellblue" createVehicle position vehicle player;Flare7 attachTo [vehicle player,[-3,0,0]];
Flare8 = "SmokeShell" createVehicle position vehicle player;Flare8 attachTo [vehicle player,[-4,0,0]];
*/