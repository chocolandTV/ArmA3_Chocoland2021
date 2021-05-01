
private["_seed", "_objectType", "_pos","_objectList"];
_objectList=[
"C_Kart_01_F",
"C_Tractor_01_F",
"I_G_Quadbike_01_F",
"C_Hatchback_01_sport_F",
"C_SUV_01_F",
"C_Offroad_02_unarmed_F",
"C_Offroad_01_F",
"I_G_Offroad_01_F",
"B_GEN_Offroad_01_gen_F",
"C_Van_01_transport_F",
"C_Van_01_fuel_F",
"C_Van_02_vehicle_F",
"C_Van_02_transport_F",
"B_GEN_Van_02_transport_F",
"C_Van_02_service_F",
"O_Truck_03_device_F",
"O_Truck_03_medical_F",
"O_Truck_03_repair_F",
"I_Truck_02_ammo_F",
"I_Truck_02_medical_F",
"B_UGV_01_F",
"B_UGV_01_rcws_F",
"I_UGV_01_F",
"I_UGV_01_rcws_F",
"O_UGV_01_F",
"O_UGV_01_rcws_F",
"B_CTRG_LSV_01_light_F",
"B_T_LSV_01_unarmed_F",
"B_T_LSV_01_armed_F",
"B_T_LSV_01_AT_F",
"O_T_LSV_02_unarmed_F",
"O_T_LSV_02_armed_F",
"O_T_LSV_02_AT_F",
"B_MRAP_01_F",
"B_MRAP_01_hmg_F",
"B_MRAP_01_gmg_F",
"O_MRAP_02_F",
"O_MRAP_02_hmg_F",
"O_MRAP_02_gmg_F",
"I_MRAP_03_F",
"I_MRAP_03_hmg_F",
"I_MRAP_03_gmg_F",
"O_APC_Wheeled_02_rcws_v2_F",
"B_APC_Wheeled_01_cannon_F",
"I_APC_Wheeled_03_cannon_F",
"B_AFV_Wheeled_01_cannon_F",
"B_AFV_Wheeled_01_up_cannon_F", 
"I_LT_01_scout_F",
"I_LT_01_cannon_F",
"I_LT_01_AT_F",
"I_LT_01_AA_F",
"B_APC_Tracked_01_CRV_F",
"B_APC_Tracked_01_rcws_F",
"I_APC_tracked_03_cannon_F",
"O_APC_Tracked_02_cannon_F",
"B_APC_Tracked_01_AA_F",
"O_APC_Tracked_02_AA_F",
"B_MBT_01_cannon_F",
"B_MBT_01_TUSK_F",
"O_MBT_02_cannon_F", 
"I_MBT_03_cannon_F",
"O_MBT_04_cannon_F",
"O_MBT_04_command_F",
"Land_BarGate_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall4_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_MetalBarrel_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Loudspeakers_F",
	"Land_Timbers_F",
	"Land_TreeBin_F",
	"Land_Water_source_F",
	"Land_AncientPillar_F",
	"Land_AncientPillar_damaged_F",
	"Land_AncientPillar_fallen_F",
	"Land_BellTower_01_V1_F",
	"Land_BellTower_01_V2_F",
	"Land_Calvary_01_V1_F",
	"Land_Chapel_V1_F",
	"Land_Chapel_V2_F",
	"Land_Chapel_Small_V1_F",
	"Land_Bricks_V1_F",
	"Land_Bricks_V2_F", 
	"Land_CinderBlocks_F",
	"Land_Coil_F",
	"Land_ConcretePipe_F",
	"Land_Pallet_F",
	"Land_Pallet_vertical_F",
	"Land_Pipes_large_F",
	"Land_WheelCart_F",
	"Land_WoodenBox_F",
	"Land_WorkStand_F",
	"Land_Grave_memorial_F",
	"Land_Grave_monument_F",
	"Land_Grave_obelisk_F",
	"Land_Grave_V1_F",
	"Land_LampAirport_off_F",
	"Land_LampDecor_off_F",
	"Land_LampDecor_F",
	"Land_LampSolar_F",
	"Land_MarketShelter_F",
	"Land_HBarrier_01_big_4_green_F",
	"Land_HBarrier_01_big_tower_green_F",
	"Land_HBarrier_01_line_1_green_F",
	"Land_HBarrier_01_line_3_green_F",
	"Land_HBarrier_01_line_5_green_F",
	"Land_HBarrier_01_tower_green_F",
	"Land_HBarrier_01_wall_4_green_F",
	"Land_HBarrier_01_wall_6_green_F",
	"Land_HBarrier_01_wall_corner_green_F",
	"Land_HBarrier_01_wall_corridor_green_F"
];
SERVERSPAWNING = true;
// server loopSpawn
while {SERVERSPAWNING} do
{ 

	_objectType = selectRandom _objectList;

	_pos = [[[position player,500]],[]] call BIS_fnc_randomPos;

	[_objectType, _pos]call parachuteRandomSupply;
	
sleep 300;
	
};