// _nul =[this] execVM "MILSIM\milsim_vests.sqf"; this addAction ["<t color='#b8860b'>" + "Uniformes" + "</t>","",("Uniformes")]; this allowDamage false;

_crate = _this select 0;

while {alive _crate} do {
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargoGlobal _crate;

	// Mochilas Equipe Black
	_crate addbackpackcargo ["BlackTeam_BP_Base",10];
	_crate addbackpackcargo ["BlackTeam_BP_Leader_Base",10];
	_crate addbackpackcargo ["BlackTeam_BP_Medic_Base",10];
	_crate addbackpackcargo ["BlackTeam_BP_EOD_Base",10];
	_crate addbackpackcargo ["BlackTeam_BP_Heavy_Base",10];
	_crate addbackpackcargo ["BlackTeam_BlackBP_Base",10];
	_crate addbackpackcargo ["BlackTeam_BlackBP_Leader_Base",10];
	_crate addbackpackcargo ["BlackTeam_BlackBP_Medic_Base",10];
	_crate addbackpackcargo ["BlackTeam_BlackBP_EOD_Base",10];
	_crate addbackpackcargo ["BlackTeam_BlackBP_Heavy_Base",10];
	
	// Mochilas Equipe Gold
	_crate addbackpackcargo ["GoldTeam_BP_Base",40];
	_crate addbackpackcargo ["GoldTeam_BP_Leader_Base",40];
	_crate addbackpackcargo ["GoldTeam_BP_Medic_Base",40];
	_crate addbackpackcargo ["GoldTeam_BP_EOD_Base",40];
	_crate addbackpackcargo ["GoldTeam_BP_Heavy_Base",40];
	_crate addbackpackcargo ["GoldTeam_BlackBP_Base",40];
	_crate addbackpackcargo ["GoldTeam_BlackBP_Leader_Base",40];
	_crate addbackpackcargo ["GoldTeam_BlackBP_Medic_Base",40];
	_crate addbackpackcargo ["GoldTeam_BlackBP_EOD_Base",40];
	_crate addbackpackcargo ["GoldTeam_BlackBP_Heavy_Base",40];
	
	// Capacetes Equipe Black
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A01",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A02",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A03",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A04",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A05",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A06",10];
	_crate AddWeaponCargo ["BlackTeam_BlackHelmet_A07",10];
	
	// Capacete Equipe Gold
	_crate AddWeaponCargo ["GoldTeam_Helmet",40];
	_crate AddWeaponCargo ["GoldTeam_Helmet_LEADER",10];
	_crate AddWeaponCargo ["GoldTeam_BlackHelmet",40];
	_crate AddWeaponCargo ["GoldTeam_BlackHelmet_LEADER",10];
	
	// Capacetes Equipe Red
	_crate AddWeaponCargo ["MILSIM_Crewman_Helmet",10];
	
	// Capacetes Equipe Blue
	_crate AddWeaponCargo ["HeliPilot_Helmet",10];
	_crate AddWeaponCargo ["FighterPilot_Helmet",10];
	
	// Uniformes Equipe Gold
	_crate AddWeaponCargo ["MILSIM_BDU",40];
	_crate AddWeaponCargo ["MILSIM_BDU2",40];
	_crate AddWeaponCargo ["MILSIM_DesertBDU",40];
	_crate AddWeaponCargo ["MILSIM_DesertBDU2",40];
	_crate AddWeaponCargo ["MILSIM_BlackTGBDU",40];
	_crate AddWeaponCargo ["MILSIM_BlackTGBDU2",40];
	
	// Uniformes Equipe Black
	_crate AddWeaponCargo ["BlackTeam_DiverBDU",10];
	_crate AddWeaponCargo ["BlackTeam_DiverBDUCamo",10];
	
	// Uniformes Equipe Red
	_crate AddWeaponCargo ["Crewman_BDU",10];
	
	// Uniformes Equipe Blue
	_crate AddWeaponCargo ["HeliPilot_BDU",10];
	_crate AddWeaponCargo ["FighterPilot_BDU",10];
	
	// Coletes Equipe Black
	_crate AddWeaponCargo ["BLACKTEAM_VEST",10];
	_crate AddWeaponCargo ["BLACKTEAM_BLACKVEST",10];
	_crate AddWeaponCargo ["BLACKTEAM_DIVERGEAR",10];
	_crate AddWeaponCargo ["BLACKTEAM_DIVERGEARCamo",10];
	
	// Coletes Equipe Gold
	_crate AddWeaponCargo ["GOLDTEAM_VEST",40];
	_crate AddWeaponCargo ["GOLDTEAM_BLACKVEST",40];
	
	// Coletes Equipe Red
	_crate AddWeaponCargo ["Crewman_VEST",10];
	
	// Coletes Equipe Blue
	_crate AddWeaponCargo ["Pilot_VEST",10];

	sleep 600;
};