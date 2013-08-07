// _nul =[this] execVM "MILSIM\equip_box.sqf"; this addAction ["<t color='#b8860b'>" + "Equipamentos" + "</t>","",("Equipamentos")]; this allowDamage false;

_crate = _this select 0;

while {alive _crate} do {
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargoGlobal _crate;

	_crate additemcargo ["ItemGPS",50];
	_crate additemcargo ["ItemMap",50];
	_crate additemcargo ["ItemWatch",50];
	_crate additemcargo ["ItemCompass",50];
	_crate additemcargo ["Medikit",50];
	_crate additemcargo ["ToolKit",50];
	_crate additemcargo ["FirstAidKit",100];
	_crate additemcargo ["NVGoggles",50];
	_crate addweaponcargo ["Binocular",50];
	_crate addweaponcargo ["Rangefinder",50];
	_crate addweaponcargo ["MineDetector",50];
	_crate addMagazinecargo ["Laserbatteries",50];
	
	sleep 600;
};