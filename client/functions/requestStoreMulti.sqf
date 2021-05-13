private ["_requestTimeout", "_obj", "_dir","_pos","_para","_player","_playerMoney","_skin","_collisionObjects"];
_player = player;
_price = _this select 1;
_skin = _this select 2;

_playerMoney = player getVariable ["cmoney", 0];

[_player, -_price] call A3W_fnc_setCMoney;
[] spawn fn_savePlayerData;

diag_log format ["Parastore Spawning ID , PRICE -  %1,  %2",_this select 0, _this select 1];
_dir = getDir player;
_pos = getPosATL player;
_pos = [(_pos select 0)+15*sin(_dir),(_pos select 1)+15*cos(_dir),(_pos select 2)];
if(_this select 0 == "Goat_Cart") exitWith{call goatCart;};
if((_this select 0) == "Land_Carrier_01_base_F" || (_this select 0) == "Land_Destroyer_01_base_F")exitWith
{
	[_this select 0] call createCarrierDestroyer;
};
_obj = createVehicle [(_this select 0), _pos, [], 0, "CAN_COLLIDE"];
_obj allowdamage false;
_obj setVariable ["A3W_purchasedStoreObject", true];
_obj setVariable ["ownerUID", getPlayerUID _player, true];
_obj setVariable ["ownerName", name _player, true];
_obj setPlateNumber name _player;
_obj setDir _dir;
_obj setDamage 0;
_obj allowdamage true;

if((_skin) != "object")then{[_obj, (_skin)] call applyVehicleTexture;};

_obj enableCollisionWith player;
OBJ = _obj;
publicVariable"OBJ";
chocostring = "OBJ enableCollisionWith player;";
publicVariable"chocostring";

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

