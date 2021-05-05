if (!isServer) exitWith {};

private ["_animalBomb","_markerArray","_animalGroup","_animalArray","_markerAirships"];

_markerArray= ["BS_1","BS_2","BS_3","BS_4","BS_5","BS_6","BS_7", "BS_8","BS_9","BS_10",
"BS_11","BS_12","BS_13","BS_14","BS_15","BS_16","BS_17","BS_18","BS_19","BS_20","BS_21",
"BS_22","BS_23","BS_24","BS_25","BS_26","BS_27","BS_28","BS_29","BS_30","BS_31","BS_32",
"BS_33","BS_34","BS_35","BS_36","BS_37","BS_38","BS_39","BS_40","BS_41","BS_41", "BS_42", "BS_43","BS_44", "BS_45", "BS_46", "BS_47","BS_48","BS_49","BS_50",
"BS_50","BS_51","BS_52","BS_53","BS_54","BS_55","BS_56","BS_57","BS_58","BS_59"];

_markerAirships= ["planeSpawn_1","planeSpawn_2","planeSpawn_3","planeSpawn_4","planeSpawn_5","planeSpawn_6","planeSpawn_7","planeSpawn_8","planeSpawn_9","planeSpawn_10"];

_animalGroup = createGroup Civilian; 

_animalArray = ["Rabbit_F","Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Rabbit_F","Snake_random_F","Snake_vipera_random_F",
"Turtle_F","Hen_random_F","Cock_random_F","Cock_white_F","Fin_sand_F","Fin_blackwhite_F","Fin_ocherwhite_F","Fin_tricolour_F","Fin_random_F","Alsatian_Sand_F","Alsatian_Black_F",
"Alsatian_Sandblack_F","Alsatian_Random_F","Goat_random_F","Sheep_random_F"];

_animalBomb = {
_private=["_player"];
_player = _this;
_pos = getPos _player;
_bomb = "ModuleOrdnanceHowitzer_F_ammo" createVehicle _pos;
_bomb setposATL _pos;
};
_spawningObject={ 

	private ["_pos","_objClass","_randomPos","_obj"];
	_pos = _this select 0;
	_objClass = selectRandom objectList;
	_randomPos = [_pos, 30, 400, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_randomPos set [2,0];
	_obj = createVehicle [_objClass, _randomPos, [], 0, "NONE"];
	_obj allowDamage _allowDamage;
	_obj setVariable ["allowDamage", _allowDamage, true];
	_randomPos = getPosATL _obj;
	_randomPos set [2, (_pos select 2)];
	_obj setPos _randomPos;
};

_spawningVehicle={

private ["_pos","_objClass","_randomPos","_obj","_weapon", "_mag"];
_pos = _this select 0;
_objClass = selectRandom vehicleList;
_randomPos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_randomPos set [2, 0];
_obj = createVehicle [_objClass, _randomPos, [], 0, "NONE"];
_obj setFuel 1;
_obj setVehicleAmmo 1;
_obj setVelocity [0,0,0.01];
_obj setDamage (0);
//_obj enableCollisionWith player;
_weapon = randomweaponarray call BIS_fnc_selectRandom;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
_obj addMagazineCargoglobal [_mag,2];
_obj addWeaponCargoglobal [_weapon,2];
_obj setPosATL [ _randomPos select 0,  _randomPos select 1, 1.5];

};
_spawningAirships={

private ["_pos","_objClass","_randomPos","_obj","_weapon", "_mag"];
_pos = _this select 0;
_pos set [2,0];
_objClass =selectRandom airVehicles;
_obj = createVehicle [_objClass, _pos, [], 0, "NONE"];
_obj setFuel 1;
_obj setVehicleAmmo 1;
_weapon = selectRandom randomweaponarray;
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
_obj addMagazineCargoglobal [_mag,2];
_obj addWeaponCargoglobal [_weapon,2];
_obj setPos _pos;
};
_spawningMoney=
{
private ["_pos","_randomPos","_cash"];
_pos = _this select 0;
_pos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_pos set [2,0];
_cash = createVehicle ["Land_Money_F", _pos,[], 0, "NONE"];
_cash setVariable ["cmoney", (floor random 100)*100, true];
_cash setVariable ["owner", "world", true];
_cash setPos _pos;


};
_spawningAnimals=
{
private ["_pos","_randomPos","_obj"];
_pos = _this select 0;
_pos = [_pos, 30, 200, 10, 0, 0.1, 0] call BIS_fnc_findSafePos;
_pos set [2,0];
_objClass = selectRandom _animalArray;
_obj = _animalGroup createUnit [_objClass, _pos,[],0,"NONE"];
//_obj setVariable ["BIS_fnc_animalBehaviour_disable", true];
//[_obj, ["Become Animal", {call Choco_fnc_becomeAnimal; }]] remoteExec ["addAction",2,true];
_obj addEventHandler ["killed", {[this]call _animalBomb;}];
_obj setPos _pos;
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
	
diag_log format ["####### Choco Server Spawning ###### - Finished and spawned 600 Objects"];
