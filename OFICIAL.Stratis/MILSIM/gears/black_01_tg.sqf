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
_unit addvest "BLACKTEAM_VEST";
_unit addHeadgear "BlackTeam_Helmet_A01"; 
_unit addbackpack "BlackTeam_BP_Leader_Base";
_unit addGoggles "G_Tactical_Black";

_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "AR_BlackTeam_SOPMOD";
_unit additem "acc_flashlight";

_unit addWeapon "hgun_P07_F";
_unit addHandgunItem "muzzle_snds_L";


_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";


_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";

_unit addmagazine "DemoCharge_Remote_Mag";
_unit addmagazine "DemoCharge_Remote_Mag";

_unit addmagazine "SmokeShell";
_unit addmagazine "SmokeShell";
_unit addmagazine "REV1_flash";
_unit addmagazine "REV1_flash";

_unit addItem "MediKit";

_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";


_unit addItem "ACRE_PRC343_ID_13";
_unit assignItem "ACRE_PRC343_ID_13";
_unit addItem "ACRE_PRC148_UHF_ID_11";


_unit addWeapon "rangefinder";
_unit addWeapon "LaserDesignator";
_unit addmagazine "Laserbatteries";

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


if(true) exitWith{};