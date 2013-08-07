waitUntil {!isNull player};

_unit = _this select 1;

removeAllItems _unit;
removeVest _unit;
removeUniform _unit; 
removeAllWeapons _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeAllAssignedItems _unit;
removeallcontainers _unit;

_unit addUniform "MILSIM_BDU";
_unit addvest "GOLDTEAM_VEST";
_unit addHeadgear "GoldTeam_Helmet";
_unit addbackpack "GoldTeam_BP_MG";

_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "LMG_Mk200_F";
_unit addWeapon "hgun_P07_F";
_unit addPrimaryWeaponItem "optic_Hamr";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addHandgunItem "muzzle_snds_L";

_unit addWeapon "Binocular";
_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";
_unit addmagazine "SmokeShell";
_unit addmagazine "SmokeShell";
_unit addmagazine "SmokeShellGreen";
_unit addmagazine "SmokeShellRed";
_unit addmagazine "REV1_flash";
_unit addmagazine "REV1_flash";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "200Rnd_65x39_cased_Box";
_unit addmagazine "16Rnd_9x21_Mag";


_unit additem "NVGoggles";
_unit assignItem "NVGoggles";
_unit additem "ItemMap";
_unit assignItem "ItemMap";
_unit additem "ItemGPS";
_unit assignItem "ItemGPS";
_unit additem "ItemCompass";
_unit assignItem "ItemCompass";
_unit additem "ItemWatch";
_unit assignItem "ItemWatch";
_unit addItem "ACRE_PRC343_ID_13";
_unit assignItem "ACRE_PRC343_ID_13";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addGoggles "G_Tactical_Clear";

if(true) exitWith{};