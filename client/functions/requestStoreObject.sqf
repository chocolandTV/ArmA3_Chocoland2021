 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Version: 1.0
//	@file Name: requestStoreObject.sqf
//	@file Author: AgentRev
//	@file Created: 24/10/2012 18:32

// Must only be called in buyItems.sqf, buyGuns.sqf, or buyVehicles.sqf

#define OBJECT_PURCHASE_TIMEOUT 15
#define OBJECT_PURCHASE_POST_TIMEOUT 5

private ["_requestTimeout", "_obj", "_dir","_pos","_para","_player","_playerMoney","_skin","_collisionObjects"];
//spawning
closeDialog 0;
_player = player;
_price = _this select 1;
_skin = _this select 2;
 _collisionObjects=["Land_WIP_F", "Land_Church_01_V1_F", "Land_Amphitheater_F", "Land_MultistoryBuilding_03_F","Land_Hotel_01_F", "Land_Cathedral_01_F","Land_Airport_01_controlTower_F"];
_playerMoney = player getVariable ["cmoney", 0];
_player setVariable ["cmoney", _playerMoney - _price, true];
[_player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;

diag_log format ["Parastore Spawning ID , PRICE -  %1,  %2",_this select 0, _this select 1];
_dir = getdir player;
_pos = getPosatl player;
_pos = [(_pos select 0)+50*sin(_dir),(_pos select 1)+50*cos(_dir),(_pos select 2)+250];
if((_this select 0) == "Land_Carrier_01_base_F" || (_this select 0) == "Land_Destroyer_01_base_F")then
{
	_pos= (getPosASL player);
	
};
_obj = createVehicle [(_this select 0), _pos, [], 0, "NONE"];
_obj allowdamage false;
_obj setVariable ["A3W_purchasedStoreObject", true];
_obj setVariable ["ownerUID", getPlayerUID _player, true];
_obj setVariable ["ownerName", name _player, true];
_obj setPlateNumber name _player;
if((_this select 0) == "Land_Carrier_01_base_F" || (_this select 0) == "Land_Destroyer_01_base_F")exitWith
{
	_obj setPosASL (getPosASL player);
	_obj setDamage (0.00);
	_obj allowdamage true;
	[_obj, player] remoteExecCall ["enableCollisionWith", 0, _obj];
	diag_log format ["carrier or destroyer Delievered"];
};
if((_skin) != "object")then{[_obj, (_skin)] call applyVehicleTexture;};
if((_this select 0) in _collisionObjects)then {[_obj, player] remoteExecCall ["enableCollisionWith", 0, _obj];};
private _isUAV = (round getNumber (configFile >> "CfgVehicles" >> (_this select 0) >> "isUav") > 0);
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

while {(getPos _obj select 2) > 2 and (alive _para)and(alive _obj)}
do{
_para setVectorUp [0,0,1];
_para setVelocity [0, 0, ((velocity _para) select 2)*1.2];
sleep 0.1;
};
deTach _obj;
sleep 2;

deleteVehicle _para;
_obj allowdamage true;
_obj setDamage 0;
diag_log format ["Parastore Delievered"];
if (["A3W_playerSaving"] call isConfigOn) then
		{
			[] spawn fn_savePlayerData;
		};