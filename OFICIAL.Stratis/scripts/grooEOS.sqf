//
//grooEOS.SQF FOR ARMA III
//
//Place a 50x50 Red Rectangle marker and name it
//null = ["parameter1",parameter2,parameter3,parameter4,parameter5] execvm "EOS.sqf"
//Null = ["mkr1",360,"Patrol"] execVM "grooEOS.sqf"
//Parameter1 - "Markername"
//Parameter2 - "Detection Distance"

/*Parameter3

	"GARRISON"		Small Group that Garrison buildings.
	"Patrol" 		Small Group that patrols inside the marker
	"Squad"  		A squad that patrols  inside de marker
	"Platoon"		A Platton that Garrison and Patrol the Marker
	"ATTEAM"  		AT Squad that Patrol the marker
	"Sniper"		Sniper Team
	"SpecOps"		Spec Ops that Ambush and Patrol
	"Armoured"		A tank that patrols the markerAlpha
	"CUSTOM"		A array of [[units],[ranks],[UPSparams]]
	
*/

//Writen By Groo based on the				
//Script Written by BangaBob
//version 0.1
//

//--------------------------------------------MAKE CHANGES BELOW-------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//----------------------------------------------AI GROUP POOL----------------------------------------------------------------

if !isServer exitwith {};

private ["_garrison","_garrisonRanks","_garrisonSkills","_scouts","_scoutsRanks","_scoutsSkills","_Patrol","_PatrolRanks","_PatrolSkills","_Squad","_SquadRanks","_squadSkills","_Platoon","_PlatoonRanks","_PlatoonSkills","_ATTEAM","_ATTEAMRanks","_ATTEAMSkills","_AATEAM","_AATEAMRanks","_AATEAMSkills","_Snipers","_SniperRanks","_SniperSkills","_SpecOps","_SpecOpsRanks","_specOpsSkills","_Armour","_markerPosition","_mkrName","_enemySide","_loop","_debugHint","_debug","_mkrAreaX","_mkrAreaY","_mkrSize","_detectionDistanceY","_detectionDistanceX","_cacheDistanceY","_cacheDistanceX","_radiusPlacement","_reinforcementPlacement","_SideAdjust","_aiSide","_detectionSide","_sideAdjust","_spotFriendlies","_spotEnemies","_UCthis","_i","_e","_Tanks","_crewTanks","_Groups","_UCThis","_spwnposnew","_ranks","_skills","_upsParam","_patrolRanks","_patrolSkills","_patrol","_spwnposNew","_squad","_platton","_atteamSkills","_atteam","_aateamSkills","_aateam","_snipersSkills","_snipers","_SpecOpsSkills","_newGroup","_param","_mkrname","_tankType","_tank","_tanks","_Tank","_crewTank","_spotFriendlyLeaving","_units"];

_garrison 			= [
						"O_Soldier_F",
						"O_Soldier_AR_F",	
						"O_Soldier_F",	
						"O_Soldier_F"
					];

_garrisonRanks 		= [];
_garrisonSkills 	= [0.1,0.4];

_scouts				=["O_Recon_F","O_Recon_F"];
_scoutsRanks 		=[];
_scoutsSkills		=[0.4,0.7];

_Patrol 			=[
						"O_Soldier_GL_F",
						"O_Soldier_F",
						"O_Soldier_GL_F",
						"O_Soldier_F",
						"O_Soldier_GL_F"
					];
						
_PatrolRanks 		=[];
_PatrolSkills		=[0.25,0.4];

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

_Platoon 	=[
			
			/*Defensive*/		[],
			/*Patrolling*/		[],
			/*Offensive*/		[]
			
			];
_PlatoonRanks =[
								[],
								[],
								[]
			];

_PlatoonSkills =[[0.25,0.4],[0.25,0.4],[0.25,0.4]];

_ATTEAM		  =["O_Soldier_TL_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_LAT_F"];
_ATTEAMRanks  =[];
_ATTEAMSkills =[0.25,0.4];

_AATEAM		  =["O_Soldier_TL_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_LAT_F"];
_AATEAMRanks  =[];
_AATEAMSkills =[0.25,0.4];

_Snipers		=["O_Sniper_F","O_Spotter_F"];
_SniperRanks = [];
_SniperSkills = [0.7,0.9];

_SpecOps 	=[
			"O_recon_TL_F",
			"O_recon_exp_F",
			"O_recon_exp_F",
			"O_recon_M_F",
			"O_scout_F",
			"O_scout_F"
			];
			
_SpecOpsRanks = [];
_specOpsSkills = [0.7,0.9];

_Armour		=["O_APC_Wheeled_02_rcws_F"];

//--------------------------------------------EXECVM PARAMETERS---------------------------------------------------------------

// convert argument list to uppercase

_markerPosition = markerPos (_this select 0);				 	
_mkrName = (_this select 0);				 	

_enemySide = 0;
_loop = [];
_loop = _this;
_debugHint = PARAMEDITMODE;
_debug = false;

//----------------------------------------------USEFUL PARAMETERS--------------------------------------------------------------

//_mkrAreaX = (markersize _mkrName) select 0;
//_mkrAreaY = (markersize _mkrName) select 1;

_mkrSize = getmarkersize _mkrName;
_detectionDistanceY = (_mkrSize select 0) + (_this select 1);
_detectionDistanceX = (_mkrSize select 1) + (_this select 1);
_cacheDistanceY = (_detectionDistanceY + 150);	
_cacheDistanceX = (_detectionDistanceX + 150);					//RECOMMENDED DISTANCE 75 // NEED TO BE BIDIMENTIONAL
_radiusPlacement = 50;											//RECOMMEND RADIUS OF MARKER // NOT USED YET
_reinforcementPlacement = (_radiusPlacement + 200);				//RADIUS OF MARKER + 200m // NOT USED YET


//--------------------------------------------CONSTRUCT SIDE VARIABLES-----------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
switch (_enemySide) do
{
	case 0:
	{
	if (_debugHint) then {Hint "EAST AI selected";};
	_SideAdjust = east;
	_aiSide = "EAST"; 
	_detectionSide = "WEST";
	};
	
	case 1:
	{
	if (_debugHint) then {Hint "WEST AI selected";};
	_sideAdjust = West;
	_detectionSide = "EAST";
	_aiSide = "WEST";
	};
	case 2:
	{
	if (_debugHint) then {Hint "GUER AI selected";};
	_sideAdjust = GUER;
	_aiSide = "GUER";
	_detectionSide = "EAST";
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//--------------------------------------------CONSTRUCT DETECTION STRUCTURES-----------------------------------------------------------

	_spotFriendlies = createTrigger ["EmptyDetector",_markerPosition]; 
	_spotFriendlies setTriggerArea [_detectionDistanceY,_detectionDistanceX,0,true]; 
	_spotFriendlies setTriggerActivation [_detectionSide,"PRESENT",true]; 
	_spotFriendlies setTriggerStatements ["this","",""]; 
	_spotFriendlies setTriggerType "NONE";
	_spotFriendlies;


	_spotEnemies = createTrigger ["EmptyDetector",_markerPosition]; 
	_spotEnemies setTriggerArea [_detectionDistanceY,_detectionDistanceX,0,true]; 
	_spotEnemies setTriggerActivation [_aiSide,"NOT PRESENT",true]; 
	_spotEnemies setTriggerStatements ["this","",""]; 
	_spotEnemies setTriggerType "NONE"; 
	_spotEnemies;

sleep 1;

//------------------------------------------------BEGIN SPAWNING GROUPS-----------------------------------------------------------------

Waituntil {triggeractivated _spotFriendlies};
if (_debugHint) then {player sidechat format["%1 Activated",_mkrName];};

_UCthis = [];
for [{_i=0},{_i<count _this},{_i=_i+1}] do {_e=_this select _i; if (typeName _e=="STRING") then {_e=toUpper(_e)};_UCthis set [_i,_e]};

_Tanks = [];
_crewTanks = [];
_Groups = [];
for [{_i=2},{_i<count _UCthis},{_i=_i+1}] do {

		switch (_UCThis  select _i) do {
			case "GARRISON":{
							_spwnposnew = _markerPosition;
							_ranks	= _garrisonRanks;	
							_skills = 	[0.25,0.4];
							_upsParam = ["FORTIFY","NOMOVE","SHOWMARKER","SPAWNED","DELETE:",60];
							_units = _garrison;
							}; 
							
			case "PATROL":{
							_spwnposnew = _markerPosition;
							_ranks = _patrolRanks;
							_skills = 	_patrolSkills;
							_upsParam = ["RANDOM","NOFOLLOW","SHOWMARKER","SPAWNED","DELETE:",60];
							_units = _patrol;
							}; 
							
							
			case "SCOUTS":{
							_spwnposnew = _markerPosition;
							_skills = 	_scoutsSkills;
							_upsParam =	["NOSLOW","RANDOM","NOFOLLOW","SHOWMARKER","SPAWNED","DELETE:",60];
							_units = _scouts;
							}; 
			case "SQUAD":{
							_spwnposNew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
							_skills = 	_squadSkills;
							_upsParam =	["MOVE","SHOWMARKER","SPAWNED","DELETE:",60];		
							_units = _squad;
							}; 
							
			case "PLATOON":{
							_spwnposNew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
							_skills = 	[0.25,0.4];
							_upsParam =	["SHOWMARKER","SPAWNED","DELETE:",60];		
							_units = _platton;
							}; 
							
			case "ATTEAM":{
							_spwnposNew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
							_skills = 	_atteamSkills;
							_upsParam =	["MOVE","SHOWMARKER","SPAWNED","DELETE:",60];
							_units = _atteam;
							}; 
			case "AATEAM":{
							_spwnposNew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
							_skills = 	_aateamSkills;
							_upsParam =	["MOVE","SHOWMARKER","SPAWNED","DELETE:",60];
							_units = _aateam;
							}; 				
			case "SNIPERS":{
							_spwnposnew = _markerPosition;
							_skills = _snipersSkills;							
							_upsParam =	["RANDOM","AMBUSH","SHOWMARKER","SPAWNED","DELETE:",60];								
							_units = _snipers;
							}; 
			case "SPECOPS":{
							_spwnposnew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
							_skills = 	_SpecOpsSkills;
							_upsParam =	["AMBUSH","SHOWMARKER","SPAWNED","DELETE:",60];								
							_units = _SpecOps;
							}; 
		};
								
		if !((_UCThis Select _i) == "ARMOUR") then {
			if (isServer) then {	

						_upsParam = _upsParam + ["SHOWMARKER","SPAWNED","DELETE:",60];
						_newGroup = [_spwnposnew,_sideAdjust,_units,[],[],_skills]call BIS_fnc_spawnGroup;

						_param = [(leader _newGroup),_mkrname] + _upsParam;
						nul= _param execVM "scripts\UPSMON.sqf";
						_Groups = _Groups + [_newGroup];
				};
				
			if (_debugHint) then {player sidechat format["Spawning ",(_UCThis select _i)];};
				
				
		} else {
					if (isServer) then {
						_tankType = _Armour select (floor(random(count _Armour)));
						_spwnposNew = [_markerPosition, random _radiusPlacement, random 359] call BIS_fnc_relPos;
						_upsParam = ["SHOWMARKER","SPAWNED","DELETE:",60];

						_newGroup = createGroup _sideAdjust;
						_tank = [_spwnposNew, random 359, _tankType, _newGroup] call bis_fnc_spawnvehicle;
						
						nul=[(leader _newGroup),_mkrname,_upsParam] execVM "scripts\UPSMON.sqf";
		

						_Tanks = _tanks + [_Tank select 0];
						
						_crewTank = _tank select 1;
						 {_crewTanks = _crewTanks + [_x];} forEach _crewTank;
						
						_Groups = _Groups + [_newGroup];
						
						};
						
						if (_debugHint) then {player sideChat format ["Spawning Tank %1",_tankType]};						

		
			};
		
};
		
		
		if (_debugHint) then {player sidechat format["Spawned %1 Groups",(count _Groups)];};


//----------------------------------------------------CACHE UNITS-----------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			_spotFriendlyLeaving = createTrigger ["EmptyDetector",_markerPosition]; 
			_spotFriendlyLeaving setTriggerArea [_cacheDistanceY,_cacheDistanceX,0,true]; 
			_spotFriendlyLeaving setTriggerActivation [_detectionSide,"NOT PRESENT",true]; 
			_spotFriendlyLeaving setTriggerStatements ["this","",""]; 
			_spotFriendlyLeaving setTriggerType "NONE"; 
			_spotFriendlyLeaving;
			sleep 1;
		
		Waituntil {triggeractivated _spotFriendlies};	
		while {true} do {		
				if (triggeractivated _spotFriendlyLeaving) then {
					if (_debugHint) then {player sidechat format["EOS Leaving %1",_mkrName];};
					if (_debugHint) then {player sidechat format["Deleting %1 groups in %2",(count _Groups),_mkrName];};
					
					{deleteVehicle _x} forEach (_crewTanks);
					{deleteVehicle _x} forEach (_Tanks);
										
					{
					{deleteVehicle _x} forEach units _x;
					deleteGroup _x;
					} forEach _Groups;
					
					{deleteVehicle _x} forEach (_Tanks);
					{deleteVehicle _x} forEach (_crewTanks);
					
					} else {										

							if (triggeractivated _spotEnemies) then {
									sleep 0.5;_mkrname setMarkerColor "ColorGreen";
							} else {
									_mkrname setMarkerColor "ColorRed";
							};
							
					};
								
				if (triggeractivated _spotFriendlyLeaving) exitWith{};
				sleep 1;

	};

if (triggeractivated _spotEnemies) then {

			if (_debugHint) then {player Sidechat format ["Script ended in %1. No more AI will spawn here",_mkrName];};
			
			
			} else {
			
			if (_debugHint) then {player Sidechat format [str(_this) + " Restarting EOS in ",_mkrName];};
			
			nul = _this execvm "scripts\grooEOS.sqf";
};

if (_debugHint) then {player Sidechat format ["Deleting EOS markers in ",_mkrName];};
deleteVehicle _spotFriendlies;deleteVehicle _spotFriendlyLeaving;deleteVehicle _spotEnemies;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////END SCRIPT////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		