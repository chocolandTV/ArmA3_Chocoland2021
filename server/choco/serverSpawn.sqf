if (!isServer) exitWith {};

private ["_animalBomb","_markerArray","_animalGroup","_animalArray","_markerAirships"];

_markerArray= ["boatSpawn_1","boatSpawn_2","boatSpawn_3","boatSpawn_4","boatSpawn_5","boatSpawn_6","boatSpawn_7", "boatSpawn_8","boatSpawn_9","boatSpawn_10",
"boatSpawn_11","boatSpawn_12","boatSpawn_13","boatSpawn_14","boatSpawn_15","boatSpawn_16","boatSpawn_17","boatSpawn_18","boatSpawn_19","boatSpawn_20","boatSpawn_21",
"boatSpawn_22","boatSpawn_23","boatSpawn_24","boatSpawn_25","boatSpawn_26","boatSpawn_27","boatSpawn_28","boatSpawn_29","boatSpawn_30","boatSpawn_31","boatSpawn_32",
"boatSpawn_33","boatSpawn_34","boatSpawn_35","boatSpawn_36","boatSpawn_37","boatSpawn_38","boatSpawn_39"];

_markerAirships= ["planeSpawn_1","planeSpawn_2","planeSpawn_3","planeSpawn_4","planeSpawn_5","planeSpawn_6","planeSpawn_7","planeSpawn_8","planeSpawn_9","planeSpawn_10"];

_animalGroup = createGroup Civilian; 

_animalArray = ["Rabbit_F","Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Rabbit_F","Snake_random_F","Snake_vipera_random_F",
"Turtle_F","Hen_random_F","Cock_random_F","Cock_white_F","Fin_sand_F","Fin_blackwhite_F","Fin_ocherwhite_F","Fin_tricolour_F","Fin_random_F","Alsatian_Sand_F","Alsatian_Black_F",
"Alsatian_Sandblack_F","Alsatian_Random_F","Goat_random_F","Sheep_random_F"];

_animalBomb = {
_private=["_player"];
_player = _this select 0;
_pos = getPosATL _player;
_bomb = "R_230mm_fly" createVehicle _pos;
_bomb setposATL _pos;
};
_spawningObject={ 

	private ["_pos","_objClass","_randomPos","_obj"];
	_pos = _this select 0;
	_objClass = selectRandom objectList;
	_randomPos = [_pos, 30, 400, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_obj = createVehicle [_objClass, _randomPos, [], 0, "NONE"];
	_obj allowDamage true;
	_obj setVariable ["allowDamage", true, true];
};

_spawningVehicle={

private ["_pos","_objClass","_randomPos","_obj","_weapon", "_mag"];
_pos = _this select 0;
_objClass = selectRandom vehicleList;
_randomPos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_randomPos set [2, 0];
_obj = createVehicle [_objClass, _randomPos, [], 0, "NONE"];
_obj setDamage 0;
_obj setFuel 1;
_obj setVehicleAmmo 1;
//_obj enableCollisionWith player;
_weapon = randomweaponarray call BIS_fnc_selectRandom;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
_obj addMagazineCargoglobal [_mag,2];
_obj addWeaponCargoglobal [_weapon,2];
_obj setVariable ["allowDamage", true, true];
};
_spawningAirships={

private ["_pos","_objClass","_randomPos","_obj","_weapon", "_mag"];
_pos = _this select 0;
_objClass =selectRandom airVehicles;
_obj = createVehicle [_objClass, _pos, [], 0, "NONE"];
_obj setDamage 0;
_obj setFuel 1;
_obj setVehicleAmmo 1;
_weapon = selectRandom randomweaponarray;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
_obj addMagazineCargoglobal [_mag,2];
_obj addWeaponCargoglobal [_weapon,2];
_obj setVariable ["allowDamage", true, true];
};
_spawningMoney=
{
private ["_pos","_randomPos","_cash"];
_pos = _this select 0;
_pos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_cash = createVehicle ["Land_Money_F", _pos,[], 0, "NONE"];
_cash setVariable ["cmoney", (floor random 100)*100, true];
_cash setVariable ["owner", "world", true];
//[_cash] spawn A3W_fnc_setItemCleanup;

};
_spawningAnimals=
{
private ["_pos","_randomPos","_obj"];
_pos = _this select 0;
_pos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_objClass = selectRandom _animalArray;
_obj = _animalGroup createUnit [_objClass, _pos,[],0,"NONE"];
//_obj setVariable ["BIS_fnc_animalBehaviour_disable", true];
[_obj, ["Become Animal", {execVM"client\choco\becomeAnimal.sqf; }]] remoteExec ["addAction"];
_obj addEventHandler ["killed", {[this]call _animalBomb;}];
};
//server init spawn
{
	[getMarkerPos _x]call _spawningAirships
}forEach _markerAirships;

{
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningObject;
	[getMarkerPos _x]call _spawningVehicle;
	[getMarkerPos _x]call _spawningMoney;
	[getMarkerPos _x]call _spawningAnimals;

}forEach _markerArray;
	
diag_log format ["####### Choco Server Spawning ###### - Finished and spawned 460 Objects"];
