GROO_fnc_ConsoleMSG = {

	private ["_paramMSG","_paramColor","_color","_msg"];

	//Param Parse
	_paramMSG = _this select 0;
	if (count _this > 1) then {_paramColor = _this select 1;} else {_paramColor = "";};

	
	if groo_console_enabled then {
		if isServer then {
			while {true} do {
				if (_paramColor == "red") exitWith {_color = "#1000"};
				if (_paramColor == "green") exitWith {_color = "#0100"};
				if (_paramColor == "blue") exitWith {_color = "#0010"};
				if true exitWith {_color = "#1000"};
			};
			
			_msg = _paramMSG;
			"debug_console" callExtension (_msg + _color);
		};
	};
};