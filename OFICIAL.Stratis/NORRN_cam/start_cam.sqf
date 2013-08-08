// start_cam.sqf
// © OCTOBER 2011 - norrin
private ["_unit","_curVcl","_oldVcl"];
_unit = player;
if (count _this > 0) then {_unit = _this select 0};
if (_unit != player) exitWith {};
_curVcl 	  = vehicle player;
_oldVcl 	  = _curVcl;
NORRN_sMCam	  = _curVcl addAction ["Switch on cam", "NORRN_cam\init_NORRNCam.sqf", "", 0, false, true];
Nor_MCAM 	  = compile PreprocessFile "NORRN_cam\NORRN_cam.sqf";
Nor_MCAM_KEY  = compile preprocessfile "NORRN_cam\CAM_KEY_pressed.sqf";
Nor_MCAM_hint = compile preprocessfile "NORRN_cam\CAM_hint.sqf";
while {true} do
{	
	while {alive player && _curVcl == _oldVcl} do 
	{	
		_oldVcl = _curVcl;
		sleep 0.5;
		_curVcl = vehicle player;
		sleep 0.5;
	};
	_oldVcl removeAction NORRN_sMCam;
	sleep 1;
	while {!alive player} do {sleep 0.5};
	_curVcl = vehicle player;
	_oldVcl = _curVcl;
	NORRN_sMCam  = _curVcl addAction ["Switch on cam", "NORRN_cam\init_NORRNCam.sqf", "", 0, false, true];
};