 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Name: server\admins.sqf

if (!isServer) exitWith {};


	// Low Administrators: manage & spectate players, remove hacked vehicles
	lowAdmins = compileFinal str
	[
		
	];

	// High Administrators: manage & spectate players, remove hacked vehicles, show player tags
	highAdmins = compileFinal str
	[
		// Put player UIDs here
	];

	// Server Owners: access to everything, including god mode, money, guns, and vehicles
	serverOwners = compileFinal str
	[
		"76561198078783807",
		"76561198010316297",
		"76561197981614079"

	];

	/********************************************************/


if (typeName lowAdmins == "ARRAY") then { lowAdmins = compileFinal str lowAdmins };
if (typeName highAdmins == "ARRAY") then { highAdmins = compileFinal str highAdmins };
if (typeName serverOwners == "ARRAY") then { serverOwners = compileFinal str serverOwners };

publicVariable "lowAdmins";
publicVariable "highAdmins";
publicVariable "serverOwners";
