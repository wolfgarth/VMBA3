// _nul =[this] execVM "MILSIM\empty_box.sqf"; this allowDamage false;

if (!isServer) exitWith {};

_crate = _this select 0;

while {alive _crate} do {
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargoGlobal _crate;
	
	sleep 60; // Added by Andrade for Better Performance
};