// _nul =[this] execVM "hk\Box_none.sqf";

if (!isServer) exitWith {};

_crate = _this select 0;

while {alive _crate} do {
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargoGlobal _crate;
};