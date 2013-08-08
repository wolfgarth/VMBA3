// _nul =[this] execVM "MILSIM\ammo.sqf";

_crate = _this select 0;

while {alive _crate} do {
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargoGlobal _crate;

	_crate addweaponcargo ["MineDetector",50];
	_crate addweaponcargo ["Rangefinder",50];
	_crate addweaponcargo ["Laserdesignator",50];
	_crate addweaponcargo ["launch_Titan_short_F",50];
	_crate addweaponcargo ["launch_B_Titan_F",50];
		
	_crate additemcargo ["optic_Arco",50];
	_crate additemcargo ["optic_Hamr",50];
	_crate additemcargo ["optic_Aco",50];
	_crate additemcargo ["optic_ACO_grn",50];
	_crate additemcargo ["optic_Holosight",50];
	_crate additemcargo ["acc_flashlight",50];
	_crate additemcargo ["acc_pointer_IR",50];
	_crate additemcargo ["ItemGPS",50];
	_crate additemcargo ["ItemMap",50];
	_crate additemcargo ["ItemWatch",50];
	_crate additemcargo ["Medikit",50];
	_crate additemcargo ["ToolKit",50];
	_crate additemcargo ["FirstAidKit",100];
	_crate additemcargo ["ACRE_PRC343_ID_13",50];
	_crate additemcargo ["ACRE_PRC148_UHF_ID_11",50];
	_crate additemcargo ["ACRE_PRC119_ID_1",50];
	_crate additemcargo ["NVGoggles",50];

	_crate addMagazinecargo ["30Rnd_9x21_Mag",100];
	_crate addMagazinecargo ["30rnd_556x45_Stanag",200];
	_crate addMagazinecargo ["30Rnd_45ACP_Mag_SMG_01",100];
	_crate addMagazinecargo ["20Rnd_762x51_Mag",100];
	_crate addMagazinecargo ["200Rnd_65x39_cased_Box",100];
	_crate addMagazinecargo ["16Rnd_9x21_Mag",100];
	_crate addMagazinecargo ["Titan_AA",50];
	_crate addMagazinecargo ["Titan_AP",50];
	_crate addMagazinecargo ["Titan_AT",50];
	_crate addMagazinecargo ["Laserbatteries",50];

	sleep 600;
};