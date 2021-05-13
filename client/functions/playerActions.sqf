 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
_animalBool = { 
_animalArray = ["Rabbit_F","Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Rabbit_F","Snake_random_F","Snake_vipera_random_F",
"Turtle_F","Hen_random_F","Cock_random_F","Cock_white_F","Fin_sand_F","Fin_blackwhite_F","Fin_ocherwhite_F","Fin_tricolour_F","Fin_random_F","Alsatian_Sand_F","Alsatian_Black_F",
"Alsatian_Sandblack_F","Alsatian_Random_F","Goat_random_F","Sheep_random_F"];
_animal =  count nearestObjects [cursorTarget,_animalArray, 18] > 0;
_animal
};
{ [player, _x] call fn_addManagedAction } forEach
[
	["Holster Weapon", { player action ["SwitchWeapon", player, player, 100] }, [], -11, false, false, "", "vehicle player == player && currentWeapon player != '' && (stance player != 'CROUCH' || currentWeapon player != handgunWeapon player)"], // A3 v1.58 bug, holstering handgun while crouched causes infinite anim loop
	
	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -10, false], //, false, "", ""],

	[format ["<t color='%1'>[</t>Parachute Store<t color='%1'>]</t>", "#0101DF"], "client\systems\generalStore\loadGenStore.sqf", [], -9, false], //, false, "", ""],
	
	[format ["<img image='client\icons\r3f_unlock.paa'/> [Attach this Vehicle]", "#0101DF"], "client\choco\attachThisVehicle.sqf", [], -8, true, true, "", "!isNull cursorTarget &&  bool (crew cursorTarget) ==[] && !ATTACHING && alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],
	
	[format ["<img image='client\icons\r3f_unlock.paa'/> [Attach to this Vehicle]", "#0101DF"], "client\choco\attachThisVToThis.sqf", [], -7, true, true, "", "!isNull cursorTarget &&  bool (crew cursorTarget) ==[] && ATTACHING && alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],
	
	[format ["<img image='\a3\ui_f\data\map\vehicleicons\iconanimal_ca.paa'/> [Catch and become Animal]", "#0101DF"], "client\choco\catchAnimal.sqf", [], -8, true, true, "", "(call _animalBool) && {player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],
	
	[format ["<img image='\A3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa'/> [Safe my base to market]", "#0101DF"], "client\choco\safeBaseMarket.sqf", [], -8, true, true, "", "typeOf cursorTarget == 'Land_Device_assembled_F' && saveBaseMarket && {player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],
	
	[format ["<img image='\a3\ui_f\data\map\vehicleicons\iconanimal_ca.paa'/> [Bite (SPACE)]", "#0101DF"], "client\choco\animalBiteAction.sqf", [], -8, true, true, "", "ANIMALBITE && ANIMALMODE && isPlayer cursorTarget && player distance cursorTarget < 5"],
	
	[format ["<img image='\a3\ui_f\data\map\vehicleicons\iconanimal_ca.paa'/> [Plant a Bomb (G)]", "#0101DF"], "client\choco\animalPlantAction.sqf", [], -7, true, true, "", "ANIAMLBOMB && ANIMALMODE && isPlayer cursorTarget && player distance cursorTarget < 5"],
	
	[format ["<img image='\a3\ui_f\data\map\vehicleicons\iconanimal_ca.paa'/> [reverse to player]", "#0101DF"], "client\choco\reverseSkin.sqf", [], -7, true, true, "", "ANIMALMODE"],
	
	[format ["<img image='\A3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa'/> [destroy basecore]", "#0101DF"], "client\choco\fnc_destroyBasecore.sqf", [], -6, true, true, "", "typeOf cursorTarget == 'Land_Device_assembled_F' && {player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],
	
	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'}count (player nearEntities ['Land_Money_F', 5]) > 0"],

	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", { doCancelAction = true }, [], 1, false, false, "", "mutexScriptInProgress"],

	["<img image='client\icons\repair.paa'/> Salvage", "client\actions\salvage.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && !(cursorTarget isKindOf 'Man') && {player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],

	["<img image='client\icons\r3f_unlock.paa'/> Acquire Vehicle Ownership", "client\actions\takeOwnership.sqf", [], 1, false, false, "", "[] call fn_canTakeOwnership isEqualTo ''"],

	["[0]"] call getPushPlaneAction,
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],

	["<img image='client\icons\driver.paa'/> Enable driver assist", fn_enableDriverAssist, [], 0.5, false, true, "", "_veh = objectParent player; alive _veh && !alive driver _veh && {effectiveCommander _veh == player && player in [gunner _veh, commander _veh] && {_veh isKindOf _x} count ['LandVehicle','Ship'] > 0 && !(_veh isKindOf 'StaticWeapon')}"],
	["<img image='client\icons\driver.paa'/> Disable driver assist", fn_disableDriverAssist, [], 0.5, false, true, "", "_driver = driver objectParent player; isAgent teamMember _driver && {(_driver getVariable ['A3W_driverAssistOwner', objNull]) in [player,objNull]}"],

	[format ["<t color='#FF0000'>Emergency eject (Ctrl+%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]],  { [[], fn_emergencyEject] execFSM "call.fsm" }, [], -9, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase')"],
	[format ["<t color='#FF00FF'>Open parachute (%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]], A3W_fnc_openParachute, [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"]
];

if (["A3W_vehicleLocking"] call isConfigOn) then
{
	[player, ["<img image='client\icons\r3f_unlock.paa'/> Pick Lock", "addons\scripts\lockPick.sqf", [cursorTarget], 1, false, false, "", "alive cursorTarget && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3 && {{cursorTarget isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorTarget == 2 && !(cursorTarget getVariable ['A3W_lockpickDisabled',false]) && cursorTarget getVariable ['ownerUID','0'] != getPlayerUID player && 'ToolKit' in items player}}"]] call fn_addManagedAction;
};

// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};

if (["A3W_savingMethod", "profile"] call getPublicVar == "extDB") then
{
	if (["A3W_vehicleSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Enable Vehicle Saving", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Force Save Vehicle", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};

	if (["A3W_staticWeaponSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Enable Turret Saving", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Force Save Turret", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};
};
