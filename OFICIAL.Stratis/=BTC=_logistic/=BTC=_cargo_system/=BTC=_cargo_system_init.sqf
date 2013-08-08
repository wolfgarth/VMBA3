waitUntil {!isNull player};
waitUntil {player == player};
#include "=BTC=_functions.sqf"
BTC_action_cargo = false;
BTC_l_dragging   = false;
BTC_cargo_repo = "Land_HBarrierBig_F" createVehicleLocal [- 5000,- 5000,0];//[- 2000,-2000,0];
if (isServer) then {BTC_id_repo = 10;publicVariable "BTC_id_repo";};
_dlg   = player addaction [("<t color=""#00FF00"">") + ("Check Vehicle") + "</t>",BTC_dir_action,[[],BTC_l_check_vehicle],7,true,false,"","count (nearestObjects [player, BTC_def_vehicles, 5]) > 0 || {vehicle player isKindOf _x} count BTC_def_vehicles > 0"];
_sel   = player addaction [("<t color=""#00FF00"">") + ("Select") + "</t>",BTC_dir_action,[[],BTC_l_select],7,true,false,"","vehicle player == player && count (nearestObjects [player, BTC_def_cargo, 5]) > 0"];
_load  = player addaction [("<t color=""#00FF00"">") + ("Load") + "</t>",BTC_dir_action,[[],BTC_l_load],7,true,false,"","vehicle player == player && !isNull BTC_cargo_selected && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0"];
_drag  = player addaction [("<t color=""#00FF00"">") + ("Drag") + "</t>",BTC_dir_action,[[],BTC_l_drag],7,true,false,"","vehicle player == player && count (nearestObjects [player, BTC_def_drag, 5]) > 0"];
_eh = player addEventHandler ["respawn", 
{
	_actions = [] spawn 
	{
		waitUntil {Alive player};
		BTC_action_cargo = false;
		BTC_l_dragging   = false;
		_dlg   = player addaction [("<t color=""#00FF00"">") + ("Check Vehicle") + "</t>",BTC_dir_action,[[],BTC_l_check_vehicle],7,true,false,"","count (nearestObjects [player, BTC_def_vehicles, 5]) > 0 || {vehicle player isKindOf _x} count BTC_def_vehicles > 0"];
		_sel   = player addaction [("<t color=""#00FF00"">") + ("Select") + "</t>",BTC_dir_action,[[],BTC_l_select],7,true,false,"","vehicle player == player && count (nearestObjects [player, BTC_def_cargo, 5]) > 0"];
		_load  = player addaction [("<t color=""#00FF00"">") + ("Load") + "</t>",BTC_dir_action,[[],BTC_l_load],7,true,false,"","vehicle player == player && !isNull BTC_cargo_selected && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0"];
		_drag  = player addaction [("<t color=""#00FF00"">") + ("Drag") + "</t>",BTC_dir_action,[[],BTC_l_drag],7,true,false,"","vehicle player == player && count (nearestObjects [player, BTC_def_drag, 5]) > 0"];
	};
}];
BTC_cargo_capacity =
[
	[
		//Cars
		"B_MRAP_01_F",
		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"O_MRAP_02_F",
		"O_MRAP_02_gmg_F",
		"O_MRAP_02_hmg_F",
		"B_Quadbike_01_F",
		"C_Offroad_01_F",
		"O_Quadbike_01_F",
		"I_Quadbike_01_F",
		"I_MRAP_03_F",
		"I_MRAP_03_gmg_F",
		"I_MRAP_03_hmg_F",		
		//Trucks
		"B_Truck_01_transport_F",
		"B_Truck_01_covered_F",
		"I_Truck_02_covered_F",
		"O_Truck_02_covered_F",
		"I_Truck_02_transport_F",
		"O_Truck_02_transport_F",
		"O_Truck_02_transport_F"
	]
	,
	[
	
	]
];