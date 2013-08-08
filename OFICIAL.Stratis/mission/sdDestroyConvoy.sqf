_mkrConvoyStartName = "mkrConvoyStart";
_mkrConvoyEndName = "mkrConvoyEnd";

_startPosArray = [[2457.6,1155.76,0.00145864]];
_endPosArray = [[4336.04,3788.36,0.00117493]];

_startPos = _startPosArray select (floor(random (count _startPosArray)));
_endPos =  _endPosArray select (floor(random (count _endPosArray)));

_Squad 				=[
						
	
						"O_Soldier_SL_F",
						"O_Soldier_TL_F",
						"O_Soldier_AR_F",
						"O_Soldier_LAT_F",
						"O_Soldier_GL_F",
						"O_Soldier_TL_F",
						"O_Soldier_AR_F",
						"O_Soldier_GL_F",
						"O_Soldier_F",
						"O_Medic_F"	
					];
					
_SquadRanks 		=[];
_squadSkills		=[0.25,0.4];

private["_vehArray","_startMarker","_endMarker","_convoyVeh","_spawnPos"];

_startMarker = createMarker [_mkrConvoyStartName, _startPos];
_startMarker setmarkertype "hd_dot";
_startMarker setmarkertext "Convoy Start";
_startMarker setmarkercolor "colorBlack";

_endMarker = createMarker [_mkrConvoyEndName, _endPos];
_endMarker setmarkertype "hd_dot";
_endMarker setmarkertext "Convoy End";
_endMarker setmarkercolor "colorBlack";

_convoyArray = [];
_Groups = [];

if (isServer) then {
	
	GROO_ExecQUEUE = GROO_ExecQUEUE + 1;
	sleep (GROO_ExecQUEUE);
	GROO_ExecQUEUE = GROO_ExecQUEUE - 1;

	_veharray = [_startPos, random 360, "O_Truck_02_covered_F", east] call BIS_fnc_spawnVehicle;
	Cveh1 = _vehArray select 0;
	
	GROO_ExecQUEUE = GROO_ExecQUEUE + 1;
	sleep (GROO_ExecQUEUE);
	GROO_ExecQUEUE = GROO_ExecQUEUE - 1;

	_newGroup = [_startPos,East,_squad,[],[],_squadSkills]call BIS_fnc_spawnGroup;
	
	_convoyArray = _convoyArray + [_veharray];
	_Groups = _Groups + [_newGroup];

	{
		_x moveinCargo Cveh1;
	
	} foreach units _newGroup;
	
	GROO_ExecQUEUE = GROO_ExecQUEUE + 1;
	sleep (GROO_ExecQUEUE);
	GROO_ExecQUEUE = GROO_ExecQUEUE - 1;
	
	_spawnPos = [ _startPos , 40 , 200] call BIS_fnc_relPos;
	
	_veharray = [_spawnPos, random 360, "O_Truck_02_covered_F", east] call BIS_fnc_spawnVehicle;
	Cveh2 = _vehArray select 0;
	
	GROO_ExecQUEUE = GROO_ExecQUEUE + 1;
	sleep (GROO_ExecQUEUE);
	GROO_ExecQUEUE = GROO_ExecQUEUE - 1;

	_newGroup = [_spawnPos,East,_squad,[],[],_squadSkills]call BIS_fnc_spawnGroup;
	
	_convoyArray = _convoyArray + [_veharray];
	_Groups = _Groups + [_newGroup];
	
	{
		_x moveinCargo Cveh2;
	
	} foreach units _newGroup;
	


};
	
	
[[_mkrConvoyendName],[Cveh1,Cveh2],true] execVM "convoyDefend\convoyDefend_init.sqf";

	
	

//deletemarker _startMarker;
//deletemarker _endMarker;