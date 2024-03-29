/**
 * Copyright (C) 2010 madbull ~R3F~
 */
 atthfix = 1;
_currentAnim =	animationState player;
_config = configFile >> "CfgMovesMaleSdr" >> "States" >> _currentAnim;
_onLadder =	(getNumber (_config >> "onLadder"));
if(_onLadder == 1) exitWith{player globalChat "You can't move this object while on a ladder";};

if (R3F_LOG_mutex_local_verrou) exitWith
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

private _objet = _this select 0;

if (unitIsUAV _objet && {!(_objet getVariable ["ownerUID","0"] isEqualTo getPlayerUID player) && !(group (uavControl _objet select 0) in [grpNull, group player])}) then
{
	player globalChat STR_R3F_LOG_action_deplacer_objet_UAV_group;
}
else
{
	R3F_LOG_mutex_local_verrou = true;

	R3F_LOG_objet_selectionne = objNull;

	private ["_isSwimming", "_est_calculateur", "_arme_principale", "_arme_principale_accessoires", "_arme_principale_magasines", "_action_menu_release_relative", "_action_menu_release_horizontal" , "_action_menu_45", "_action_menu_90", "_action_menu_180", "_azimut_canon", "_muzzles", "_magazine", "_ammo", "_adjustPOS"];

	if(isNil {_objet getVariable "R3F_Side"}) then {
		_objet setVariable ["R3F_Side", (playerSide), true];
	};

	_isSwimming = { [["Aswm","Assw","Absw","Adve","Asdv","Abdv"], animationState _this] call fn_startsWith };

	_tempVar = false;
	if(!isNil {_objet getVariable "R3F_Side"}) then {
		if(playerSide != (_objet getVariable "R3F_Side")) then {
			{if(side _x ==  (_objet getVariable "R3F_Side") && alive _x && _x distance _objet < 150) exitwith {_tempVar = true;};} foreach AllUnits;
		};
	};
	if(_tempVar) exitwith {
		hint format["This object belongs to %1 and they're nearby you cannot take this.", _objet getVariable "R3F_Side"]; R3F_LOG_mutex_local_verrou = false;
	};
	_objet setVariable ["R3F_Side", (playerSide), true];

	// Si l'objet est un calculateur d'artillerie, on laisse le script spécialisé gérer
	_est_calculateur = _objet getVariable "R3F_ARTY_est_calculateur";
	if !(isNil "_est_calculateur") then
	{
		R3F_LOG_mutex_local_verrou = false;
		[_objet] execVM "addons\R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\deplacer_calculateur.sqf";
	}
	else
	{
		_objet setVariable ["R3F_LOG_est_deplace_par", player, true];

		R3F_LOG_joueur_deplace_objet = _objet;
		_arme_principale = currentMuzzle player;

		//player forceWalk true;
		player action ["SwitchWeapon", player, player, 100];

		sleep 0.5;

		// Si le joueur est mort pendant le sleep, on remet tout comme avant
		if (!alive player) then
		{
			R3F_LOG_joueur_deplace_objet = objNull;
			_objet setVariable ["R3F_LOG_est_deplace_par", objNull, true];
			// Car attachTo de "charger" positionne l'objet en altitude :
			_objet setPos [getPos _objet select 0, getPos _objet select 1, 0];
			_objet setVelocity [0,0,0];

			R3F_LOG_mutex_local_verrou = false;
		}
		else
		{
			_objectBB = _objet call fn_boundingBoxReal;
			_objectMinBB = _objectBB select 0;
			_objectMaxBB = _objectBB select 1;

			_corner1 = [_objectMinBB select 0, _objectMinBB select 1, 0] vectorDistance [0,0,0];
			_corner2 = [_objectMinBB select 0, _objectMaxBB select 1, 0] vectorDistance [0,0,0];
			_corner3 = [_objectMaxBB select 0, _objectMinBB select 1, 0] vectorDistance [0,0,0];
			_corner4 = [_objectMaxBB select 0, _objectMaxBB select 1, 0] vectorDistance [0,0,0];

			_objet attachTo [player,
			[
				0,
				1 + (_corner1 max _corner2 max _corner3 max _corner4),
				0.1 - (_objectMinBB select 2)
			]];
			R3F_LOG_mutex_local_verrou = false;
			R3F_LOG_force_horizontally = false;
			player globalChat"use the R Button for Move up and the T button for Move down the object";
			_action_menu_release_relative = player addAction [("<img image='client\icons\r3f_release.paa' color='#06ef00'/> <t color='#06ef00'>" + STR_R3F_LOG_action_relacher_objet + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\relacher.sqf", false, 5.5, true, true];
			_action_menu_release_horizontal = player addAction [("<img image='client\icons\r3f_releaseh.paa' color='#06ef00'/> <t color='#06ef00'>" + STR_RELEASE_HORIZONTAL + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\relacher.sqf", true, 5.5, true, true];
			_action_menu_45 = player addAction [("<img image='client\icons\r3f_rotate.paa' color='#06ef00'/> <t color='#06ef00'>Rotate object 45°</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\rotate.sqf", 45, 5.5, true, false];
			_action_menu_90 = player addAction [("<img image='client\ui\ui_arrow_combo_ca.paa'/> <t color='#dddd00'>Position higher</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\upanddown.sqf", 1, 5, true, false];
			_action_menu_180 = player addAction [("<img image='client\ui\ui_arrow_combo_ca.paa'/> <t color='#dddd00'>position lower</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\upanddown.sqf", 2, 5, true, false];
            atthfix = 1;
			// On limite la vitesse de marche et on interdit de monter dans un véhicule tant que l'objet est porté
			while {attachedTo R3F_LOG_joueur_deplace_objet == player && alive player} do
			{
				if (vehicle player != player) then
				{
					player globalChat STR_R3F_LOG_ne_pas_monter_dans_vehicule;
					player action ["eject", vehicle player];
					moveOut player;
					sleep 1;
				}
				else
				{
					if (currentWeapon player != "" && {!(player call _isSwimming)}) then
					{
						player action ["SwitchWeapon", player, player, 100];
					};
				};

			

				sleep 0.25;
			};

			R3F_LOG_joueur_deplace_objet = objNull;

			// L'objet n'est plus porté, on le repose
			if (attachedTo _objet == player) then
			{
				detach _objet;

				// this addition comes from Sa-Matra (fixes the heigt of some of the objects) - all credits for this fix go to him!

				_class = typeOf _objet;

				_zOffset = switch (true) do
				{
					//case (_class == "Land_Scaffolding_F"):         { 3 };
					case (_class == "Land_Canal_WallSmall_10m_F"): { 2 };
					case (_class == "Land_Canal_Wall_Stairs_F"):   { 2 };
					case (_class == "Land_PierLadder_F"):          { 2 };
					default { 0 };
				};

				if (R3F_LOG_force_horizontally) then
				{
					R3F_LOG_force_horizontally = false;

					_objectATL = getPosATL _objet;

					if ((_objectATL select 2) - _zOffset < 0) then
					{
						_objectATL set [2, 0 + _zOffset];
						_objet setPosATL _objectATL;
					}
					else
					{
						_objectASL = getPosASL _objet;
						_objectASL set [2, ((getPosASL player) select 2) + _zOffset];
						_objet setPosASL _objectASL;
					};

					_objet setVectorUp [0,0,1];
				}
				else
				{
					_objectPos =  getPosASL _objet;
					_objet setPosASL _objectPos;
				};
			_objet setVariable ["objectLocked", true, true];
			_objet setVariable ["ownerUID", getPlayerUID player, true];
			pvar_manualObjectSave = netId _objet;
			publicVariableServer "pvar_manualObjectSave";
			["Object locked!", 5] call mf_notify_client;
				_objet setVelocity [0,0,0];
			};

			player removeAction _action_menu_release_relative;
			player removeAction _action_menu_release_horizontal;
			player removeAction _action_menu_45;
			player removeAction _action_menu_90;
			player removeAction _action_menu_180;

			if (_objet getVariable ["R3F_LOG_est_deplace_par", objNull] == player) then
			{
				_objet setVariable ["R3F_LOG_est_deplace_par", objNull, true];
			};

			//player forceWalk false;
			player selectWeapon _arme_principale;

		};
	};
};
