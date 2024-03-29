 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
//@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev, [KoS] Bewilderbeest

if (isDedicated) exitWith {};
waitUntil {!isNil "A3W_serverSetupComplete"};
[] execVM "client\functions\bannedNames.sqf";
showPlayerIcons = true;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = [];
doCancelAction = false;
playerCompiledScripts = false;
playerSetupComplete = false;
waitUntil {!isNull player && time > 0};
removeAllWeapons player;
player switchMove "";
"client\actions" call mf_init;
"client\inventory" call mf_init;
"client\items" call mf_init;
call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";
//Stop people being civ's.
if !(playerSide in [BLUFOR,OPFOR,INDEPENDENT]) exitWith
{
	endMission "LOSER";
};

//Setup player events.
if (!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH] };
player addEventHandler ["Respawn", { _this spawn onRespawn }];
player addEventHandler ["Killed", onKilled];
//chocostring
"chocoString" addPublicVariableEventHandler { call compile chocoString;chocoString ="";};
call compile preprocessFileLineNumbers "addons\far_revive\FAR_revive_init.sqf";

A3W_scriptThreads pushBack execVM "client\functions\evalManagedActions.sqf";

[player, objNull] remoteExec ["A3W_fnc_playerRespawnServer", 2];



// Starting
player setVariable ["cmoney", 10000, true];
player setVariable ["bmoney", 0,false];
player setVariable["basebuilder", 0,false];
player setVariable["animalpoints", 0,false];
KEEPWEAPON =false;
NOINFO=false;
SMARTAMMO=false;
BASECORE =false;
MULTIBUY=false;
ANIMALSWIMMING = false;
ANIMALBITE =false;
ANIAMLBOMB = false;
SEAGULL = false;
ATTACH = false;
ATTACH_OBJECT = objNull;
ATTACHING=false;
ATTACHING_VEHICLE=objNull;
ATTACHING_VEHICLE_TWO= objNull;
ATTACH_X= 0;
ATTACH_Y= 0;

ANIMALMODE = false;
ANIMALNEARBY = false;
saveBaseMarket = false;
StormTime = (missionNamespace getVariable "StormTime");
[] execVM "client\choco\RandomStorm.sqf";

//Player setup
player call playerSetupStart;

// Player saving - load data
if (["A3W_playerSaving"] call isConfigOn) then
{
	call compile preprocessFileLineNumbers "persistence\client\players\setupPlayerDB.sqf";
	call fn_requestPlayerData;

	waitUntil {!isNil "playerData_loaded"};

	A3W_scriptThreads pushBack ([] spawn
	{
		scriptName "savePlayerLoop";

		// Save player every 60s
		while {true} do
		{
			sleep 60;
			call fn_savePlayerData;
		};
	});
};
[] execVM "client\choco\unlockController.sqf";
if (isNil "playerData_alive") then
{
	player call playerSetupGear;
};

player call playerSetupEnd;
diag_log format ["Player starting with %1", (player getVariable ["cmoney", 0]) call fn_numToStr];

[] execVM "territory\client\hideDisabledTerritories.sqf";

// Territory system enabled?
if (count (["config_territory_markers", []] call getPublicVar) > 0) then
{
	A3W_fnc_territoryActivityHandler = "territory\client\territoryActivityHandler.sqf" call mf_compile;
	[] execVM "territory\client\setupCaptureTriggers.sqf";
};

// Load custom keys from profile
call compile preprocessFileLineNumbers "client\clientEvents\customKeys.sqf";

//Setup Key Handler
waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];
(findDisplay 46) displayAddEventHandler ["KeyUp", onKeyRelease];

_mouseButtonToKey = "params ['_disp','_btn']; ([_disp, _btn + 65536 + ([0,128] select (_btn isEqualTo 1))] + (_this select [4,999])) call "; // actionKeys mouse bitflag + RMB fix

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", _mouseButtonToKey + "onKeyPress"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", _mouseButtonToKey + "onKeyRelease"];

call compile preprocessFileLineNumbers "client\functions\setupClientPVars.sqf";

//client Executes
A3W_scriptThreads pushBack execVM "client\systems\hud\playerHud.sqf";
A3W_scriptThreads pushBack execVM "client\systems\killFeed\killFeed.sqf";
A3W_clientSetupComplete = compileFinal "true";

[] spawn playerSpawn;

A3W_scriptThreads pushBack execVM "addons\fpsFix\vehicleManager.sqf";
A3W_scriptThreads pushBack execVM "addons\Lootspawner\LSclientScan.sqf";
[] execVM "client\functions\drawPlayerIcons.sqf";
[] execVM "addons\camera\functions.sqf";
[] execVM "addons\UAV_Control\functions.sqf";


call compile preprocessFileLineNumbers "client\functions\generateAtmArray.sqf";
[] execVM "client\functions\drawPlayerMarkers.sqf";

inGameUISetEventHandler ["Action", "_this call A3W_fnc_inGameUIActionEvent"];

{ [_x] call fn_remotePlayerSetup } forEach allPlayers;

// update player's spawn beaoon
{
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then
	{
		_x setVariable ["ownerName", name player, true];
		_x setVariable ["side", playerSide, true];
	};
} forEach pvar_spawn_beacons;

[] execVM "client\choco\Motd.sqf";
[] execVM "client\choco\supplyController.sqf";

[] execVM "client\choco\basecoreMarker.sqf";