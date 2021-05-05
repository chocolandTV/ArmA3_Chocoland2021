// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
//	@file Name: buyVehicles.sqf

scriptName "buyVehicles";
#include "dialog\vehiclestoreDefines.hpp";

storePurchaseHandle = _this spawn
{
	disableSerialization;

	private ["_switch", "_playerMoney", "_price", "_dialog", "_playerMoneyText", "_itemlist", "_itemIndex", "_itemText", "_itemData", "_colorlist", "_colorIndex", "_colorText", "_colorData", "_applyVehProperties", "_class", "_price", "_requestKey", "_vehicle"];

	//Initialize Values
	_switch = _this select 0;
	_textureDir = "client\images\vehicleTextures";
	_playerMoney = player getVariable ["cmoney", 0];

	// Grab access to the controls
	_dialog = findDisplay vehshop_DIALOG;
	_playerMoneyText = _dialog displayCtrl vehshop_money;

	_itemlist = _dialog displayCtrl vehshop_veh_list;
	_itemIndex = lbCurSel vehshop_veh_list;
	_itemText = _itemlist lbText _itemIndex;
	_itemData = _itemlist lbData _itemIndex;

	_itemData = call compile _itemData; // [name, class, price, type, variant, ...]

	_colorlist = _dialog displayCtrl vehshop_color_list;
	_colorIndex = lbCurSel vehshop_color_list;
	_colorText = _colorlist lbText _colorIndex;
	_colorData = call compile (_colorlist lbData _colorIndex);

	_partList = _dialog displayCtrl vehshop_part_list;
	_defPartsChk = _dialog displayCtrl vehshop_defparts_checkbox;
	_animList = []; // ["anim1", 1, "anim2", 0, ...] - formatted for BIS_fnc_initVehicle

	if (!cbChecked _defPartsChk) then
	{
		for "_i" from 0 to (lbSize _partList - 1) do
		{
			_animList append [_partList lbData _i, (vehshop_list_checkboxTextures find (_partList lbPicture _i)) max 0];
		};
	};

	_showInsufficientFundsError =
	{
		hint parseText format ["Not enough money for<br/>""%1""", _itemText];
		playSound "FD_CP_Not_Clear_F";
		_price = -1;
	};

	_showItemSpawnTimeoutError =
	{
		hint parseText format ["<t color='#ffff00'>An unknown error occurred.</t><br/>The purchase of ""%1"" has been cancelled.", _itemText];
		playSound "FD_CP_Not_Clear_F";
		_price = -1;
	};

	_showItemSpawnedOutsideMessage =
	{
	hint format ["""%1"" has been spawned outside, in front of the store.%2", _itemText, ["","\n\nVehicle saving will not start until manually enabled."] select ((objectFromNetId _object) getVariable ["A3W_skipAutoSave", false])];
		playSound "FD_Finish_F";
	};

	if (_itemData isEqualType []) then
	{
		_class = _itemData param [1];
		_price = _itemData param [2];

		// Ensure the player has enough money
		if (_price > _playerMoney) exitWith
		{
			[_itemText] call _showInsufficientFundsError;
		};
		if(!MULTIBUY)then 
		{	
			closeDialog 0;
			[_class, _price, _colorData] call requestStoreObject;};
		}else
		{
			[_class, _price, _colorData] call requestStoreMulti;};
		};
	};

sleep 0.01; // double-click protection
};
storePurchaseHandle = nil;
