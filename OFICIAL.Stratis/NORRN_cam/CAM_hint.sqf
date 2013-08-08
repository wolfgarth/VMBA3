// CAM_hint.sqf
// © OCTOBER 2011 - norrin
private ["_oldCAM","_hint"];
_oldCAM = -1;
_hint 	= "";
while {!NORRN_CAM_OFF} do 
{
	if (NORRN_cam_TYPE != _oldCAM) then
	{
		switch (NORRN_cam_TYPE) do
		{
			case 0: {_hint = "\n\n3rd person camera"};
			case 1: {_hint = "\n\nTop down camera (adj)"};
			case 2: {_hint = "\n\nFront side camera"};
			case 3: {_hint = "\n\n1st person camera"};	
			case 4: {_hint = "\n\nFree camera (adj)"};
			case 5: {_hint = "\n\nFly-by camera"};			
		};
		titleText [_hint, "Plain Down", 0.2];
		_oldCAM = NORRN_cam_TYPE;
	};
	sleep 0.1;
};