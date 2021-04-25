 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
 
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",

	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"B_UAV_01_F",
	"B_UAV_02_F",
	"B_MRAP_01_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_covered_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
	"B_Truck_01_box_F",
	"C_Van_01_box_F",

	"B_Truck_01_medical_F",
	"B_G_Van_01_transport_F",
	"B_G_Van_01_fuel_F",

	["C_Offroad_01_F", "I_G_Offroad_01_F"],
	["C_Offroad_02_unarmed_F", "I_C_Offroad_02_unarmed_F"],
	["C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"B_UAV_02_CAS_F",

	["B_CTRG_LSV_01_light_F", "B_T_LSV_01_unarmed_F", "O_T_LSV_02_unarmed_F", "O_T_LSV_02_unarmed_F"],
	["I_G_Offroad_01_F",       "I_C_Offroad_02_unarmed_F"],
	["I_G_Offroad_01_armed_F", "I_C_Offroad_02_LMG_F"],
	["I_G_Offroad_01_AT_F",    "I_C_Offroad_02_AT_F"]
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F",
	"B_APC_Tracked_01_rcws_F",
	 "B_APC_Tracked_01_CRV_F",
	 "B_APC_Tracked_01_AA_F",
	 "B_MBT_01_cannon_F",
	 "B_MBT_01_arty_F",
	 "B_MBT_01_mlrs_F",
	 "B_APC_Wheeled_01_cannon_F", //AMV-7 Marshall teuer
	 "B_UGV_01_F",
	 "B_UGV_01_rcws_F",
	 "O_APC_Tracked_02_cannon_F", //BTR-K Kamysh
	 "O_APC_Tracked_02_AA_F",//ZSU-39 Tigris
	 "O_MBT_02_cannon_F", //T-100 Varsuk
	 "O_MBT_02_arty_F", //  	2S9 Sochor
	 "I_APC_tracked_03_cannon_F", //FV-720 Mora
	 "I_APC_Wheeled_03_cannon_F", // AFV-4 Gorgon
	 "I_MBT_03_cannon_F" //MBT-52 Kuma
	  

];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Scooter_Transport_01_F",
	"C_Boat_Civil_01_F",
	"B_Boat_Armed_01_minigun_F",
	"B_Lifeboat",
	"B_SDV_01_F",
	"C_Boat_Civil_01_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"],
	["C_Boat_Transport_02_F", "I_C_Boat_Transport_02_F"],
	["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
"C_Heli_Light_01_civil_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_unarmed_F"
];

//Object List - Random Planes.
staticPlaneList =
[
	"C_Plane_Civil_01_F",
	"C_Plane_Civil_01_racing_F",
	"I_Plane_Fighter_03_CAS_F"
];

A3W_planeSpawnOdds = 0.5; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	[
		"hgun_PDW2000_F",
		"SMG_01_F", // Vermin
		"SMG_02_F", // Sting
		"SMG_05_F", // Protector
		[
			"SMG_03_black", // ADR-97
			"SMG_03_camo",
			"SMG_03_hex",
			"SMG_03_khaki",
			"SMG_03_TR_black",
			"SMG_03_TR_camo",
			"SMG_03_TR_hex",
			"SMG_03_TR_khaki",
			"SMG_03C_black",
			"SMG_03C_camo",
			"SMG_03C_hex",
			"SMG_03C_khaki",
			"SMG_03C_TR_black",
			"SMG_03C_TR_camo",
			"SMG_03C_TR_hex",
			"SMG_03C_TR_khaki"
		]
	],
	["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"],
	["arifle_Mk20C_F", "arifle_Mk20_F", "arifle_Mk20_GL_F"],
	["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F"],
	["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F"],
	["arifle_MXC_khk_F", "arifle_MX_khk_F", "arifle_MX_GL_khk_F", "arifle_MXM_khk_F"],
	["arifle_SPAR_01_blk_F", "arifle_SPAR_01_GL_blk_F"],
	["arifle_CTAR_blk_F", "arifle_CTAR_GL_blk_F"],
	["arifle_AKS_F", "arifle_AKM_F"],
	["arifle_AK12_F", "arifle_AK12_GL_F"],
	["srifle_EBR_F", "srifle_DMR_01_F", "srifle_DMR_07_blk_F", "arifle_SPAR_03_blk_F"],
	["arifle_SPAR_02_blk_F", "arifle_CTARS_blk_F", "LMG_03_F"],
	["arifle_MX_SW_khk_F", "LMG_Mk200_F", "LMG_Zafir_F"],

	//custom
	["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_O_Titan_F"],
	["launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F"],
	["srifle_DMR_01_F","srifle_DMR_01_ACO_F","srifle_DMR_01_MRCO_F", "srifle_DMR_01_SOS_F", "srifle_DMR_01_DMS_F","srifle_DMR_01_DMS_snds_F","srifle_DMR_01_ARCO_F"],
	["srifle_EBR_F","srifle_EBR_ACO_F",  "srifle_EBR_MRCO_pointer_F","srifle_EBR_ARCO_pointer_F", "srifle_EBR_SOS_F", "srifle_EBR_ARCO_pointer_snds_F", "srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F", "srifle_EBR_DMS_pointer_snds_F"],
	["srifle_GM6_F", "srifle_GM6_SOS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_F", "srifle_GM6_camo_SOS_F", "srifle_GM6_camo_LRPS_F"],
	["srifle_LRR_F", "srifle_LRR_SOS_F", "srifle_LRR_LRPS_F", "srifle_LRR_camo_F", "srifle_LRR_camo_SOS_F", "srifle_LRR_camo_LRPS_F"],
	["arifle_MX_GL_ACO_pointer_F", "arifle_MX_GL_Hamr_pointer_F"],
	["hgun_PDW2000_F", "hgun_PDW2000_snds_F", "hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F"],
	["SMG_01_F","SMG_01_Holo_F", "SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F"],
	["SMG_02_F", "SMG_02_ACO_F" , "SMG_02_ARCO_pointg_F"],
	["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F","LMG_Zafir_pointer_F"]
];

vehicleAddition =
[
	"muzzle_snds_L", // 9mm
	"muzzle_snds_M", // 5.56mm
	"muzzle_snds_570", // 5.7mm
	"muzzle_snds_58_blk_F", // 5.8mm
	"muzzle_snds_H", // 6.5mm
	"muzzle_snds_H_MG", // 6.5mm LMG
	"muzzle_snds_B", // 7.62mm
	"muzzle_snds_acp", // .45 ACP
	"optic_Arco",
	"optic_SOS",
	"optic_Hamr",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"acc_flashlight",
	"acc_pointer_IR",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
