 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Version: 1.0
//	@file Name: importValues.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define vehicleManagementDialog 12000
#define vehicleManagementListBox 12001
#define vehicleWeaponsText 12003
#define vehicleUsersText 12004
#define vehicleDamageText 12005
#define vehicleSpeedText 12006

#define playerMenuDialog 55500
#define playerMenuPlayerSkin 55501
#define playerMenuPlayerGun 55502
#define playerMenuPlayerItems 55503
#define playerMenuPlayerPos 55504
#define playerMenuPlayerList 55505
#define playerMenuPlayerObject 55507
#define playerMenuPlayerHealth 55508
#define playerMenuPlayerUID 55510
#define playerMenuPlayerSteam 55511
#define playerMenuBasebuilder 55700
#define playerMenuBountypoints 55701
#define playerMenuAnimalpoints 55702

disableSerialization;

private ["_index1","_type1","_dialog","_vehicleListBox","_weaponText","_userText","_damageText","_speedText","_data1"];
_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	_index1 = _this select 1;
	_type1 = _this select 0;

	_dialog = findDisplay vehicleManagementDialog;
	_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;
	_weaponText = _dialog displayCtrl vehicleWeaponsText;
	_userText = _dialog displayCtrl vehicleUsersText;
	_damageText = _dialog displayCtrl vehicleDamageText;
	_speedText = _dialog displayCtrl vehicleSpeedText;

	_dialogPlayer = findDisplay playerMenuDialog;
	_skinText = _dialogPlayer displayCtrl playerMenuPlayerSkin;
	_currentGunText = _dialogPlayer displayCtrl playerMenuPlayerGun;
	_itemsText = _dialogPlayer displayCtrl playerMenuPlayerItems;
	_posText = _dialogPlayer displayCtrl playerMenuPlayerPos;
	_healthText = _dialogPlayer displayCtrl playerMenuPlayerHealth;
	_objectText = _dialogPlayer displayCtrl playerMenuPlayerObject;
	_uidText = _dialogPlayer displayCtrl playerMenuPlayerUID;
	_steamButton = _dialogPlayer displayCtrl playerMenuPlayerSteam;
	_playerListBox = _dialogPlayer displayCtrl playerMenuPlayerList;
	_playerBasebuilder = _dialogPlayer displayCtrl playerMenuBasebuilder;
	_playerBountypoints = _dialogPlayer displayCtrl playerMenuBountypoints;
	_playerAnimalpoints = _dialogPlayer displayCtrl playerMenuAnimalpoints;


	_inCar = ["No Passengers"];
	_driver = "No Driver";
	if (_type1 == 1) then {
		_data1 = _vehicleListBox lbData _index1;
		{
			if (str(_x) == _data1) exitwith {
				_weaponText ctrlSetText format["Weapons: %1",weapons _x];
				_speedText ctrlSetText format["Speed: %1",speed _x];
				if(!isnull driver _X) then
				{
					_driver = name (driver _x);
				};
				{if(_driver != name _x) then{_inCar set [_forEachIndex, name _x];};}forEach crew _x;
				_userText ctrlSetText format["Users: %1 %2",_driver,_inCar];
				_damageText ctrlSetText format["Damage: %1",damage _x];
			};
		} foreach vehicles;
	};

	if (_type1 == 2) then {
		_data1 = _playerListBox lbData _index1;
		{
			if (getPlayerUID _x == _data1) exitwith {
				_itemsText ctrlSetText format["Items: %1",weapons _x];
				_skinText ctrlSetText format["Class: %1",typeOf(_x)];
				_posText ctrlSetText format["Position: %1",position _x];
				_objectText ctrlSetText format["Slot: %1",_x];
				_uidText ctrlSetText format ["UID: %1", getPlayerUID _x];
				_steamButton ctrlSetStructuredText parseText format ["<a href='http://steamcommunity.com/profiles/%1'><img image='\A3\ui_f\data\gui\RscCommon\RscButtonMenuSteam\steam_ca.paa' size='1.1'/></a>", getPlayerUID _x];
				_currentGunText ctrlSetText format["Money: %1", [_x getVariable ["cmoney",0]] call fn_numbersText];
				_playerBasebuilder ctrlSetText format["Basebuilderpoints: %1",[_x getVariable ["basebuilder",0]] call fn_numbersText];
				_playerBountypoints ctrlSetText format["Bountypoint: %1",[_x getVariable ["bmoney",0]] call fn_numbersText];
				_playerAnimalpoints ctrlSetText format["Animalpoints: %1",[_x getVariable ["animalpoints",0]] call fn_numbersText];
				//Calculate Health 0 - 100
				_decimalPlaces = 2;
				_health = damage _x;
				_health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
				_health = 100 - (_health * 100);

				_healthText ctrlSetText format["Health: %1",_health];
			};
		} foreach allPlayers;
	};
};
