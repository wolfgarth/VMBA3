// NORRNCam.sqf
// APRIL 2013 - norrin
private ["_d","_allUnits","_alive_friends","_r_dialog_0","_r_display","_target","_pos","_oldPos","_freePos","_oldFocus","_oldCam","_camx","_camy","_camz","_angh","_angv","_index"];
disableserialization;
// Define vars
_d 				= 0;
_allUnits 		= [];
_alive_friends 	= [];
NORRN_CAM_FOCUS = 0;
NORRN_CAM_TYPE 	= 0;
NORRN_CAM_NVG 	= false;
NORRN_CAM_OFF	= false;
_r_dialog_0 	= "";
_r_display  	= "";
_target			= objNull;
// Variables for attachTo camera
_pos 			= getPos player;
_oldPos 		= [0,0,0];
_freePos 		= [0,-5,2];
_oldFocus 		= objNull;
_oldCam 		= -1; 
// Set camera to target body
_camx 			= _pos select 0;
_camy 			= _pos select 1;
_camz 			= _pos select 2;
// Set vars for free camera 
_angh 			= 0; 
_angv 			= 45;
// Initialise camera
NORRN_cam = "camera" CamCreate [_camx,_camy+5,_camz+1];
NORRN_cam CamSetTarget player;
NORRN_cam CameraEffect ["INTERNAL","Back"];
NORRN_cam CamCommit 0;
NORRN_cam enableSimulation false;
// Identify units
_allUnits = allUnits;
{if (side _x != sideLogic && alive _x ) then {_alive_friends = _alive_friends + [_x]}} forEach _allUnits;
COUNT_CAM_friends = count _alive_friends;
// Create dialog and initialise keydown EH
_r_dialog_0 = createDialog "NORRN_cam_dialog"; 
_r_display = findDisplay 99130;
_r_display displaySetEventHandler ["Keydown", "_this call Nor_MCAM_KEY"];
titletext [" ","BLACK IN",1];
[] spawn Nor_MCAM_hint;
// Start CAM loop
while {!NORRN_CAM_OFF} do 
{
	scopeName "FollowCam_01";
	_target = vehicle (_alive_friends select NORRN_CAM_FOCUS); 
	if (!dialog) then {if (!isNull _me) then {_target = _me; NORRN_cam camsettarget _target;NORRN_cam cameraeffect ["internal", "back"];NORRN_cam camsetrelpos [-3, +1, (_max_box select 2) +1];NORRN_cam camcommit 1};};
	if (NORRN_cam_TYPE == 0 || NORRN_cam_TYPE == 3) then {_oldFocus = objNull; detach NORRN_cam;}; 
	if (NORRN_cam_TYPE == 0) then {_target switchCamera "EXTERNAL"; NORRN_cam CameraEffect ["Terminate","Back"];};
	if (NORRN_cam_TYPE == 1) then 
	{	
		showcinemaborder false;
		NORRN_cam camsettarget _target; 
		NORRN_cam cameraeffect ["internal", "back"];
		NORRN_cam attachTo [_target,[0, -2, OFPEC_range_to_unit]];
		NORRN_cam camcommit 0.01;
		_oldFocus = _target;
	};
	if (NORRN_cam_TYPE == 2) then 
	{	
		if (_target != _oldFocus || _oldcam != NORRN_cam_TYPE) then
		{
			NORRN_cam camsettarget _target; 
			NORRN_cam cameraeffect ["internal", "back"];
			NORRN_cam attachTo [_target,[-1.5, 3, 0.2]];
			NORRN_cam camSetFov 1.1; 
			NORRN_cam camcommit 0.01;
			_oldFocus = _target;
		};
	};
	if (NORRN_cam_TYPE == 3) then {_target switchCamera "INTERNAL";NORRN_cam CameraEffect ["Terminate","Back"]};
	if (NORRN_cam_TYPE == 4) then
	{ 	 
		// Mouse controls - Free cam courtesy of hoz and mandoble see: OFPEC - see: http://www.ofpec.com/forum/index.php?topic=32970.0
		if (OFPEC_MouseButtons select 1) then 
		{
			if (((OFPEC_MouseCoord select 0) >= 0) && ((OFPEC_MouseCoord select 0) <= 1) &&
			((OFPEC_MouseCoord select 1) >= 0) && ((OFPEC_MouseCoord select 1) <= 1)) then
			{
				_deltah = (0.5 - (OFPEC_MouseCoord select 0))*10/0.2;
				_deltav = (0.5 - (OFPEC_MouseCoord select 1))*10/0.2;
				_angv = (_angv + _deltav);
				_angh = (_angh + _deltah);
				_angv = _angv max 0;			
				_angv = _angv min 89;
			};						
		};
			// Change target if new 
		if (_target != _oldFocus || _oldcam != NORRN_cam_TYPE) then
		{	
			NORRN_cam CamSetTarget _target;
			NORRN_cam CameraEffect ["INTERNAL","Back"];
			NORRN_cam CamCommit 0.01;
			NORRN_cam attachTo [_target,_freePos];
			_oldFocus = _target;
		};
		_freePos = [sin(_angh)*OFPEC_range_to_unit, cos(_angh)*OFPEC_range_to_unit, OFPEC_range_to_unit*sin(_angv)];
		// Attach Camera
		if ((_freePos select 0) != (_oldPos select 0) || (_freePos select 1) != (_oldPos select 1) || (_freePos select 2) != (_oldPos select 2)) then
		{
			//detach NORRN_cam;
			NORRN_cam attachTo [_target,_freePos];
			_oldPos = _freePos; 
		};
	};
	if (NORRN_cam_TYPE == 5) then
	{	
		if (_target != _oldFocus || _oldcam != NORRN_cam_TYPE) then 
		{
			detach NORRN_cam;
			_d = 1; 
			_static_cam_pos = [(getPosASL _target) select 0, ((getPosASL _target) select 1) + 2, ((getPosASL _target) select 2) + 2];
			NORRN_cam camsettarget _target; 
			NORRN_cam cameraeffect ["internal", "back"];
			//NORRN_cam camSetPos _static_cam_pos;
			NORRN_cam camCommit 0.01;
			_oldFocus = _target;
		};
	};
	//========================================================================================	
	_oldCam = NORRN_cam_TYPE;
	sleep 0.01;
};
//destroy camera
if (NORRN_CAM_OFF) exitWith 
{
	camUseNVG false;
	closeDialog 0;
	vehicle player switchCamera "INTERNAL"; 
	NORRN_cam CameraEffect ["Terminate","Back"];
	sleep 0.1;
	NORRN_REVIVE_cam CameraEffect ["Terminate","Back"];
	CamDestroy NORRN_cam;
	//deleteVehicle _obj;
};
//Last edited 25/10/2011