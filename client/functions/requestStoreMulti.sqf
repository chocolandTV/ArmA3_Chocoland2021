
private ["_requestTimeout", "_obj", "_dir","_pos","_para","_player","_playerMoney","_skin","_collisionObjects"];
//spawning

_player = player;
_price = _this select 1;
_skin = _this select 2;
_collisionObjects=["Land_WIP_F", "Land_Church_01_V1_F", "Land_Amphitheater_F", "Land_MultistoryBuilding_03_F","Land_Hotel_01_F", "Land_Cathedral_01_F","Land_Airport_01_controlTower_F"];
_playerMoney = player getVariable ["cmoney", 0];
_player setVariable ["cmoney", _playerMoney - _price, true];
[_player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;

diag_log format ["Parastore Spawning ID , PRICE -  %1,  %2",_this select 0, _this select 1];
_dir = getDir player;
_pos = getPosATL player;
_pos = [(_pos select 0)+25*sin(_dir),(_pos select 1)+25*cos(_dir),(_pos select 2)];
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
_obj setDir _dir;
if((_this select 0) == "Land_Carrier_01_base_F" || (_this select 0) == "Land_Destroyer_01_base_F")exitWith
{
	_obj setDamage (0.00);
	_obj allowdamage true;
	[_obj, player] remoteExecCall ["enableCollisionWith", 0, _obj];
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
_obj setDamage 0;
_obj allowdamage true;
sleep 15;
if((damage _obj) > 0.8)then {
deleteVehicle _obj;
systemChat"oh Paradrop failed, you got your money back. please try again.";
_playerMoney = player getVariable ["cmoney", 0];
_player setVariable ["cmoney", _playerMoney + _price, true];
[_player, +_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;
};

