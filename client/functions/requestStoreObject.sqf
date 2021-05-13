// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
//	@file Name: requestStoreObject.sqf

params ["_objClass","_price","_skin"];
private ["_obj", "_dir","_pos","_para","_player","_playerMoney","_collisionObjects"];
if(!NOINFO)then{
titleText ["***********<br/><t color='#ff0000' size='2'>Vehicle spawns in the Air!</t><br/>***********<br/> use W, A, S, D to move parachute", "PLAIN DOWN", -1, true, true];
};
closeDialog 0;
_player = player;

[_player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;
if( _objClass == "Goat_Cart") exitWith{call goatCart;};
diag_log format ["Parastore Spawning ID %1, PRICE %2, PLAYER %3", _objClass, _price, name player];
_dir = getDir player;
_pos = getPosATL _player;
_pos = [(_pos select 0)+50*sin(_dir),(_pos select 1)+50*cos(_dir),(_pos select 2)+150];
if(( _objClass) == "Land_Carrier_01_base_F" || ( _objClass) == "Land_Destroyer_01_base_F")exitWith
{
	[ _objClass] call createCarrierDestroyer;
};
_obj = createVehicle [( _objClass), _pos, [], 0, "CAN_COLLIDE"];
_obj allowdamage false;
_obj setVariable ["A3W_purchasedStoreObject", true];
_obj setVariable ["ownerUID", getPlayerUID _player, true];
_obj setVariable ["ownerName", name _player, true];
_obj setPlateNumber name _player;
_obj setDir _dir;
if((_skin) != "object")then{[_obj, (_skin)] call applyVehicleTexture;};

_obj enableCollisionWith player;
OBJ = _obj;
publicVariable"OBJ";
chocostring = "OBJ enableCollisionWith player;";
publicVariable"chocostring";

private _isUAV = (round getNumber (configFile >> "CfgVehicles" >> ( _objClass) >> "isUav") > 0);
private _playerGroup = group _player;
_playerSide = side _playerGroup;
if (_isUAV) then
	{
	createVehicleCrew _obj;
	//assign AI to the vehicle so it can actually be used
	[_obj, _playerSide, _playerGroup] spawn
		{
		params ["_uav", "_playerSide", "_playerGroup"];
		_grp = [_uav, _playerSide, true] call fn_createCrewUAV;
		if (isNull (_uav getVariable ["ownerGroupUAV", grpNull])) then
			{
				_uav setVariable ["ownerGroupUAV", _playerGroup, true]; // not currently used
			};
		};
	};
//spawn Parachute
_para = createVehicle ["I_Parachute_02_F", _pos, [], 0, ""];
_para setPosATL _pos;
_obj attachTo [_para,[0,0,0]]; 
_para allowDamage false;
[_obj,_para, _price]spawn
{
	params ["_obj","_para", "_price"];
	while {(getPos _obj select 2) > 2 &&(alive _para)&&(alive _obj)}
	do{
		_para setVectorUp [0,0,1];
		_para setVelocity [(velocity player select 0)*3, (velocity player select 1)*3, (velocity _para select 2)*1.07];
		sleep 0.1;
	};
	deTach _obj;
	sleep 0.1;

	deleteVehicle _para;

	_obj setDamage 0;
	_obj allowdamage true;
	sleep 10;
	if((damage _obj) > 0.8)then {
		deleteVehicle _obj;
		systemChat"oh Paradrop failed, you got your money back. please try again.";
		[player, +_price] call A3W_fnc_setCMoney;
		[] spawn fn_savePlayerData;
	};
};