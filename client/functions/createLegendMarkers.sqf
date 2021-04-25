 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
 
//	@file Name: createLegendMarkers.sqf
//	@file Author: AgentRev

_markers =
[
	["Legend:", "EmptyIcon", "ColorWhite", [1,1]],

	["Feel free to use the Parastore F5", "mil_dot", "ColorBlue", [1,1]],
	["radioactive zone near GeorgeTown - you will get dmg, train your Perks and get resistance", "mil_dot", "ColorRed", [1,1]]
];


if (["A3W_privateParking"] call isConfigOn) then
{
	_markers pushBack ["Parking", "mil_dot", "ColorCIV", [1,1]];
};

if (["A3W_privateStorage"] call isConfigOn) then
{
	_markers pushBack ["Storage", "mil_dot", "ColorUNKNOWN", [1,1]];
};

_mapSize = worldSize;
_markerSpacing = 0.025 * _mapSize;
_legendMarginX = 0.035 * _mapSize;
_legendMarginY = 0.035 * _mapSize;
_markerX = _mapSize + _legendMarginX;
_legendTop = _legendMarginY + (_markerSpacing * (count _markers - 1));

{
	_x params ["_text", "_type", "_color", "_size"];

	_marker = format ["LegendMarker%1", _forEachIndex];
	_posX = _markerX - ([0, 0.02 * _mapSize] select (_type == "EmptyIcon"));
	_posY = _legendTop - (_forEachIndex * _markerSpacing);

	deleteMarkerLocal _marker;
	createMarkerLocal [_marker, [_posX, _posY]];

	_marker setMarkerTextLocal _text;
	_marker setMarkerTypeLocal _type;
	_marker setMarkerColorLocal _color;
	_marker setMarkerSizeLocal _size;
	_marker setMarkerShapeLocal "ICON";

} forEach _markers;
_name = "Georgetown Warning radioactiv";
_objPos= [5760,10305,0];
deleteMarker _marker;
_marker = "objectSearchMapMarker" + ("Georgetown");
_marker = createMarkerLocal [_marker,_objPos];
_marker setMarkerTypeLocal "ellipse";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _objPos;
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal _name;
objectSearchMapMarkers pushBack _marker;