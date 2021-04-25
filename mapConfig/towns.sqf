 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
 
//	@file Name: towns.sqf
//	@file Author: AgentRev

private _towns =
[
["Town_Doodstil", -1, "Doodstil"],
["Town_Harcourt", -1, "Harcourt"],
["Town_Lijnhaven", -1, "Lijnhaven"],
["Town_Baai", -1, "Vliegende Hollander Baai"],
["Town_Blerick", -1, "Blerick"],
["Town_BuaBua", -1, "Bua Bua"],
["Town_ChocoCity", -1, "ChocoCity"],
["Town_LaFoa", -1, "La Foa"],
["Town_Losi", -1, "Lösi"],
["Town_Orange", -1, "Orange"],
["Town_Port-Boise", -1, "Port-Boisé"],
["Town_Rereki", -1, "Rereki"],
["Town_Saioko", -1, "Saioko"],
["Town_SouthLijnhaven", -1, "South Lijnhaven"],
["Town_Taga", -1, "Taga"],
["Town_Tobakoro", -1, "Tobakoro"],
["Town_Moddergat", -1, "Moddergat"]
];

//copyToClipboard str ((allMapMarkers select {_x select [0,5] == "Town_"}) apply {[_x, -1, markerText _x]})

private "_size";
 
{
	_x params ["_marker"];

	if (markerShape _marker == "ELLIPSE") then
	{
		_size = markerSize _marker;
		_x set [1, (_size select 0) min (_size select 1)];
	};
} forEach _towns;

_towns
