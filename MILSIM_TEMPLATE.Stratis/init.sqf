if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

//VAR
_missionName = "MILSIM Template";
_missionVersion = "0.12";

//PARAMS
PARAMEDITMODE = true;

// Init Groo Framework Scripts
call compile preprocessFileLineNumbers "groo\groo_init.sqf";
[format["INFO: Starting %1 version %2 init Script",_missionName,_missionVersion],"green"] spawn groo_fnc_consoleMSG;


if PARAMEDITMODE then {
	player allowDamage false;
	onMapSingleClick "player setpos _pos";
	["INFO: Edit mode Enabled - Player Damage Disabled - Mapclick Teleport Enabled","green"] spawn groo_fnc_consoleMSG;
};

// Group Maneagement Script
["INFO: Group Maneagement Script Enabled","green"] spawn groo_fnc_consoleMSG;
[player] execVM "scripts\groupsMenu\initGroups.sqf";

["INFO: Mission Init Finished","green"] spawn groo_fnc_consoleMSG;

//Finish world initialization before mission is launched. 
finishMissionInit;
