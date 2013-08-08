//CAM_KEY_pressed.sqf start
switch ((_this select 1)) do
{
		//N key
		case 49:
		{	
			if (!NORRN_CAM_NVG) then
			{
				camUseNVG true;
				NORRN_CAM_NVG = true;
			}else {
				camUseNVG false;
				NORRN_CAM_NVG = false;
			};
		};
		//A key
		case 30:
		{	
			comment "A = Previous target";
			if (NORRN_CAM_FOCUS > 0) then 
			{
				NORRN_CAM_FOCUS = NORRN_CAM_FOCUS - 1; 
				lbSetCurSel [10005, NORRN_CAM_FOCUS];
			}; 	
		};
		//D key
		case 32:
		{	
			comment "D = Next target";
			if (NORRN_CAM_FOCUS < COUNT_CAM_friends - 1) then 
			{
				NORRN_CAM_FOCUS = NORRN_CAM_FOCUS + 1;
				lbSetCurSel [10005, NORRN_CAM_FOCUS]; 
			}; 	
		};
		//H key
		case 35:
		{	
			NORRN_CAM_OFF = true;
		};	
		//S key
		case 31:
		{	
			"S = Next camera";
			if (NORRN_CAM_TYPE < 5) then 
			{
				NORRN_CAM_TYPE = NORRN_CAM_TYPE + 1;
				lbSetCurSel [10004, NORRN_CAM_TYPE];
			};
			
		};
		//W key
		case 17:
		{	
			comment "W = Previous camera";
			if (NORRN_CAM_TYPE > 0) then 
			{
				NORRN_CAM_TYPE = NORRN_CAM_TYPE - 1;
				lbSetCurSel [10004, NORRN_CAM_TYPE];
			};
		};
		//Esc Key
		case 1: 
		{	
			comment "Esc = Destroy camera";
			NORRN_CAM_OFF = true;
		};
}; 

MouseEvents =
{
_x =0;
_y =0;
_param = _this select 1;
_type = _this select 0;
switch (_type) do {
		case "MouseMoving": 
		{
			_x = _param select 1;
			_y = _param select 2;
			OFPEC_MouseCoord = [_x, _y];	
		};
		case "MouseButtonDown": 
		{
			_x = _param select 2;
			_y = _param select 3;
			_button = _param select 1;
			OFPEC_MouseButtons set[_button, true];
		};	
		case "MouseButtonUp": 
		{
			_x = _param select 2;
			_y = _param select 3;
			_button = _param select 1;
			OFPEC_MouseButtons set[_button, false];
		};	
		case "MouseZChanged": 
		{
		  if (((_this select 1) select 1) > 0) then
		  {
			 if (OFPEC_range_to_unit > 2) then
			 {
				OFPEC_range_to_unit = OFPEC_range_to_unit - OFPEC_camzoomspeed;
			 };	   
		  }
		  else
		  {
			 if (OFPEC_range_to_unit < OFPEC_maxzoomout) then
			 {
				OFPEC_range_to_unit = OFPEC_range_to_unit + OFPEC_camzoomspeed;
			 };	   
		  };
		};	
	};	
};

