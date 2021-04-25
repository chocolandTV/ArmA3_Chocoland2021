 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
 
//	@file Name: territories.sqf
//	@file Author: AgentRev

// Territory system definitions. See territory/README.md for more details.
//
// 1 - Territory marker name. Must begin with 'TERRITORY_'
// 2 - Descriptive name
// 3 - Monetary value
// 4 - Territory category, currently unused. See territory/README.md for details.

[
	["TERRITORY_BALAVU_TRANSMITTER", "Tobakoro North", 500, "TRANSMITTER"],
	["TERRITORY_BLUE_PEARL", "Bua Bua Mountain", 500, "INDUSTRIAL"],
	["TERRITORY_COMMS_WHISKEY", "Center Mountain", 500, "TRANSMITTER"],
	["TERRITORY_KATKOULA_DEPOT", "West Mountain", 500, "INDUSTRIAL"],
	["TERRITORY_LAIKORO_DEPOT", "Lijnhaven Field", 500, "INDUSTRIAL"],
	["TERRITORY_LIFOU_TRANSMITTER", "Lösi South Mountain", 500, "TRANSMITTER"],
	//["TERRITORY_LIJNHAVEN_AIRSTRIP", "Lijnhaven Airstrip", 500, "AIRFIELD"],
	["TERRITORY_LIJNHAVEN_FORTRESS", "Lijnhaven Fortress", 500, "RUINS"],
	["TERRITORY_LILO_POWER", "Hacourt Field", 500, "POWER"],
	["TERRITORY_LUGANVILLE_TRANSMITTER", "East Coast", 500, "TRANSMITTER"],
	["TERRITORY_MONT_TANOA", "South Island", 500, "TRANSMITTER"],
	["TERRITORY_RED_SPRING", "Red Tagatown", 500, "INDUSTRIAL"],
	["TERRITORY_REGINA_RAILYARD", "Southwest Coast", 500, "INDUSTRIAL"],
	["TERRITORY_ROCHELLE_AERODROME", "Northeast Mountain", 500, "AIRFIELD"],
	["TERRITORY_ROCHELLE_RAILYARD", "SG Airstrip Field", 500, "INDUSTRIAL"],
	["TERRITORY_SE_LUMBERYARD", "Forest clearing", 500, "INDUSTRIAL"],
	["TERRITORY_SE_TRANSMITTER", "Center Radar", 500, "TRANSMITTER"],
	["TERRITORY_STJULIEN_RAILYARD", "Southwest Field", 500, "INDUSTRIAL"],
	["TERRITORY_SW_TRANSMITTER", "Southwest Transmitter", 500, "TRANSMITTER"],
	["TERRITORY_TANOA_AIRPORT_NORTH", "Lösi Southwest Mountain", 750, "AIRFIELD"],
	["TERRITORY_TANOA_AIRPORT_SOUTH", "South Coast", 750, "AIRFIELD"],
	["TERRITORY_TANOA_AIRPORT_TERMINAL", "Port-Boisé Mountain", 750, "AIRFIELD"],
	["TERRITORY_TANOUKA_REFINERY", "Moddergat Field", 500, "INDUSTRIAL"],
	["TERRITORY_TANOUKA_TRANSMITTER", "Saiko Mountain", 500, "TRANSMITTER"],
	["TERRITORY_TEMPLE_RUINS", "Small North Island", 500, "RUINS"],
	["TERRITORY_TUVANAKA_AIRBASE", "Center Mountain", 500, "AIRFIELD"],
	["TERRITORY_TUVANAKA_GSM", "Northwest Island", 500, "TRANSMITTER"],
	["TERRITORY_YANUKKA_AIRSTRIP", "East Coast", 500, "AIRFIELD"]
]

//copyToClipboard str ((allMapMarkers select {_x select [0,10] == "TERRITORY_"}) apply {[_x, markerText _x, 500, ""]})
