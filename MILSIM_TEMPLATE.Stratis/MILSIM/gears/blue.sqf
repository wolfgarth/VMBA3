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

_unit addUniform "HeliPilot_BDU";
_unit addvest "Pilot_VEST";
_unit addHeadgear "HeliPilot_Helmet"; 
_unit addbackpack "";

_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "SMG_02_F";
_unit addWeapon "hgun_P07_F";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "muzzle_snds_L";
_unit addHandgunItem "muzzle_snds_L";

_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "30Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "rangefinder";
_unit addmagazine "SmokeShellYellow";
_unit addmagazine "SmokeShellYellow";
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
_unit addItem "ACRE_PRC148_UHF_ID_11";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";

if(true) exitWith{};