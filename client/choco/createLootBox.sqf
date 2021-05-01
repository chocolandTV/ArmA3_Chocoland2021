private["_gun","_random","_dir", "_pos", "_box","_para","_randomweaponarray"];
_randomweaponarray = [
"hgun_Pistol_01_F",
"hgun_P07_F",
"hgun_P07_khk_F",
"hgun_Rook40_F",
"hgun_ACPC2_F",
"hgun_Pistol_heavy_02_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_PDW2000_F",
"SMG_05_F",
"SMG_02_F",
"SMG_01_F",
"SMG_03C_black",
"SMG_03C_camo",
"SMG_03C_hex",
"SMG_03C_khaki",
"SMG_03C_TR_black",
"SMG_03C_TR_camo",
"SMG_03C_TR_hex",
"SMG_03C_TR_khaki",
"SMG_03_black",
"SMG_03_camo",
"SMG_03_hex",
"SMG_03_khaki",
"SMG_03_TR_black",
"SMG_03_TR_camo",
"SMG_03_TR_hex",
"SMG_03_TR_khaki",
"sgun_HunterShotgun_01_f",
"sgun_HunterShotgun_01_sawedoff_f",
"arifle_SDAR_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20C_F",
"arifle_Mk20_plain_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_plain_F",
"arifle_Mk20_GL_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F",
"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MXC_Black_F",
"arifle_MXC_khk_F",
"arifle_MX_F",
"arifle_MX_Black_F",
"arifle_MX_khk_F",
"arifle_MX_GL_F",
"arifle_MX_GL_Black_F",
"arifle_MX_GL_khk_F",
"arifle_SPAR_01_blk_F",
"arifle_SPAR_01_khk_F",
"arifle_SPAR_01_snd_F",
"arifle_SPAR_01_GL_blk_F",
"arifle_SPAR_01_GL_khk_F",
"arifle_SPAR_01_GL_snd_F",
"arifle_CTAR_blk_F",
"arifle_CTAR_hex_F",
"arifle_CTAR_ghex_F",
"arifle_CTAR_GL_blk_F",
"arifle_CTAR_GL_hex_F",
"arifle_CTAR_GL_ghex_F",
"arifle_ARX_blk_F",
"arifle_ARX_hex_F",
"arifle_ARX_ghex_F",
"arifle_AKS_F",
"arifle_AKM_F",
"arifle_AK12U_F",
"arifle_AK12U_arid_F",
"arifle_AK12U_lush_F",
"arifle_AK12_F",
"arifle_AK12_arid_F",
"arifle_AK12_lush_F",
"arifle_AK12_GL_F",
"arifle_AK12_GL_arid_F",
"arifle_AK12_GL_lush_F",
"arifle_MSBS65_F",
"arifle_MSBS65_black_F",
"arifle_MSBS65_camo_F",
"arifle_MSBS65_sand_F",
"arifle_MSBS65_GL_F",
"arifle_MSBS65_GL_black_F",
"arifle_MSBS65_GL_camo_F",
"arifle_MSBS65_GL_sand_F",
"arifle_MSBS65_UBS_F",
"arifle_MSBS65_UBS_black_F",
"arifle_MSBS65_UBS_camo_F",
"arifle_MSBS65_UBS_sand_F",
"arifle_MSBS65_Mark_F",
"arifle_MSBS65_Mark_black_F",
"arifle_MSBS65_Mark_camo_F",
"arifle_MSBS65_Mark_sand_F",
"arifle_MXM_F",
"arifle_MXM_Black_F",
"arifle_MXM_khk_F",
"srifle_DMR_01_F",
"srifle_EBR_F",
"srifle_DMR_07_blk_F",
"srifle_DMR_07_hex_F",
"srifle_DMR_07_ghex_F",
"arifle_SPAR_03_blk_F",
"arifle_SPAR_03_khk_F",
"arifle_SPAR_03_snd_F",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"srifle_DMR_06_hunter_F",
"srifle_DMR_03_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_02_F",
"srifle_DMR_02_camo_F",
"srifle_DMR_02_sniper_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_hex_F",
"srifle_DMR_05_tan_f",
"srifle_LRR_LRPS_F",
"srifle_LRR_camo_LRPS_F",
"srifle_LRR_tna_LRPS_F",
"srifle_GM6_LRPS_F",
"srifle_GM6_camo_LRPS_F",
"srifle_GM6_ghex_LRPS_F",
"srifle_DMR_04_F",
"srifle_DMR_04_tan_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"arifle_MX_SW_khk_F",
"LMG_Mk200_F",
"LMG_Mk200_black_F",
"LMG_Zafir_F",
"arifle_SPAR_02_blk_F",
"arifle_SPAR_02_khk_F",
"arifle_SPAR_02_snd_F",
"arifle_CTARS_blk_F",
"arifle_CTARS_hex_F",
"arifle_CTARS_ghex_F",
"LMG_03_F",
"arifle_RPK12_F",
"arifle_RPK12_arid_F",
"arifle_RPK12_lush_F",
"MMG_02_sand_F",
"MMG_02_camo_F",
"MMG_02_black_F",
"MMG_01_tan_F",
"MMG_01_hex_F",
"launch_RPG7_F",
"launch_RPG32_F",
"launch_RPG32_ghex_F",
"launch_RPG32_green_F",
"launch_NLAW_F",
"launch_MRAWS_green_rail_F",
"launch_MRAWS_olive_rail_F",
"launch_MRAWS_sand_rail_F",
"launch_MRAWS_green_F",
"launch_MRAWS_olive_F",
"launch_MRAWS_sand_F",
"launch_O_Vorona_brown_F",
"launch_O_Vorona_green_F",
"launch_Titan_short_F",
"launch_O_Titan_short_F",
"launch_I_Titan_short_F",
"launch_B_Titan_short_tna_F",
"launch_O_Titan_short_ghex_F",
"launch_Titan_F",
"launch_O_Titan_F",
"launch_I_Titan_F",
"launch_B_Titan_tna_F",
"launch_O_Titan_ghex_F"
];
// start spawing cache
_dir = getDir player;
_pos = getPosATL player;
_pos = [(_pos select 0)+50*sin(_dir),(_pos select 1)+50*cos(_dir),(_pos select 2)+250];
_box = createVehicle ["Box_NATO_Wps_F", _pos, [], 5, "None"];
_box setDir _dir;
_box setVariable ["A3W_purchasedStoreObject", true];
_box setVariable ["ownerUID", getPlayerUID _player, true];
_box setVariable ["ownerName", name _player, true];
for "_i" from 1 to 10 do {
_gun = selectRandom _randomweaponarray;
_box addWeaponCargoGlobal [_gun, 1];
_mag = (getArray (configFile >> "Cfgweapons" >> _gun >> "magazines")) select 0;
_box addMagazineCargoGlobal [_mag, 2];
};

_box addItemCargoGlobal ["V_PlateCarrierSpec_rgr", 1];
_box addItemCargoGlobal ["Toolkit", 1];
_box addItemCargoGlobal ["Medikit", 1];
_box addItemCargoGlobal ["optic_SOS", 1];
_box addItemCargoGlobal ["optic_NVS", 1];

//spawn Parachute
_para = createVehicle ["I_Parachute_02_F", _pos, [], 0, ""];
_para setPosATL _pos;
_box attachTo [_para,[0,0,0]]; 

while {(getPos _box select 2) > 2 &&(alive _para)&&(alive _box)}
do{
_para setVectorUp [0,0,1];
_para setVelocity [0, 0, ((velocity _para) select 2)*1.2];
sleep 0.1;
};
deTach _box;
sleep 2;

deleteVehicle _para;

_box setDamage 0;
_box allowdamage true;