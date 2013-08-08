/*
Created by =BTC= Giallustio

Date: 20/03/2013
Visit us at: http://www.blacktemplars.altervista.org/
*/
//Cargo system
BTC_l_check_vehicle =
{
	//Open dlg
	_veh = objNull;_array = [];
	if (vehicle player == player) then {_array = nearestObjects [player, BTC_def_vehicles, 5];} else {_array = [vehicle player];};
	if (count _array > 0) then {_veh = _array select 0;};
	if (!isNull _veh) then
	{
		if (!isNil {_veh getVariable "BTC_cargo_cont"}) then
		{
			_text = "";
			_cargo = _veh getVariable "BTC_cargo_cont";
			_text = _text + "Vehicle: " + getText (configFile >> "cfgVehicles" >> typeof _veh >> "displayName") + "<br/>Cargo:<br/>";
			if (count _cargo > 0) then
			{
				{
					_text = _text + getText (configFile >> "cfgVehicles" >> typeof _x >> "displayName") + "<br/>";
					[_x,_veh] spawn 
					{
						_obj = _this select 0;
						_veh = _this select 1;
						private ["_sleep"];
						//player sideChat format ["%1",_obj];
						_unload = _veh addaction [("<t color=""#00FF00"">") + (format ["UnLoad %1",getText (configFile >> "cfgVehicles" >> typeof _obj >> "displayName")]) + "</t>",BTC_dir_action,[[_veh,_obj],BTC_l_unload],7,true,false,"","true"];
						_sleep = time + 15;
						waitUntil {BTC_action_cargo || (time > _sleep)};
						_veh removeAction _unload;
					};
				} foreach _cargo;
				hint parseText _text;
			} else {hint "Empty";};
		} else {hint "Empty";};
	};
};
BTC_l_select =
{
	_array = nearestObjects [player, BTC_def_cargo, 5];
	if (count _array > 0) then 
	{
		BTC_cargo_selected = _array select 0;
		if (format ["%1", BTC_cargo_selected getVariable "BTC_cannot_load"] == "1") then 
		{hint "You can not load this object";BTC_cargo_selected = objNull;} else {hint format ["%1 selected",getText (configFile >> "cfgVehicles" >> typeof BTC_cargo_selected >> "displayName")];};
	};
};
BTC_l_load =
{
	private ["_array","_veh_name","_obj_name"];
	_veh = objNull;_cargo_cont = [];
	if (count _this == 0) then {_array = nearestObjects [player, BTC_def_vehicles, 5];} else {_array = _this;};
	if (count _array > 0) then {_veh = _array select 0;} else {hint "Get closer";};
	if (!isNull _veh) then
	{
		_veh_name = getText (configFile >> "cfgVehicles" >> typeof _veh >> "displayName");
		_obj_name = getText (configFile >> "cfgVehicles" >> typeof BTC_cargo_selected >> "displayName");
		if (BTC_cargo_selected distance _veh < 15 && speed _veh < 2) then
		{
			hint format ["Loading %1 in %2",_obj_name,_veh_name];BTC_l_dragging = false;
			sleep 3;
			if (Alive BTC_cargo_selected && Alive _veh && BTC_cargo_selected distance _veh < 15 && speed _veh == 0) then
			{
				if (isNil {_veh getVariable "BTC_cargo_cont"}) then {_veh setVariable ["BTC_cargo_cont",[],false];};
				_cargo_cont = _veh getVariable "BTC_cargo_cont";
				_cargo_cont = _cargo_cont + [BTC_cargo_selected];
				_veh setVariable ["BTC_cargo_cont",_cargo_cont,true];
				BTC_cargo_selected attachTo [BTC_cargo_repo,[0,0,BTC_id_repo]];
				BTC_id_repo = BTC_id_repo + 15;publicVariable "BTC_id_repo";
				BTC_cargo_selected = objNull;
				hint format ["%1 has been loaded in %2",_obj_name,_veh_name];
			} else {hint format ["%1 has not been loaded",_obj_name];};
		} else {hint "The object is too far from the vehicle or the vehicle is moving!";};
	};
};
BTC_l_unload =
{
	_veh = _this select 0;
	_obj = _this select 1;
	BTC_action_cargo = true;
	_cargo_cont = _veh getVariable "BTC_cargo_cont";
	_id = _cargo_cont find _obj;
	if (_id != -1) then
	{
		_veh_name = getText (configFile >> "cfgVehicles" >> typeof _veh >> "displayName");
		_obj_name = getText (configFile >> "cfgVehicles" >> typeof _obj >> "displayName");
		hint format ["Unloading %1 from %2",_obj_name,_veh_name];
		sleep 3;
		hint format ["%1 has been unloaded",_obj_name,_veh_name];
		_cargo_cont set [_id,0];
		_cargo_cont = _cargo_cont - [0];
		_veh setVariable ["BTC_cargo_cont",_cargo_cont,true];
		_height = getPos (vehicle player) select 2;
		deTach _obj;
		_obj setVelocity [0,0,0];
		_obj setpos (player modelToWorld [-2,-4,0]);
		switch (true) do
		{
			case (_height >= 20):
			{
				_obj_para = [_veh,_obj,"Steerable_Parachute_F"] spawn BTC_l_paradrop;
			};
			case ((_height < 20) && (_height >= 2)):
			{
				_obj setPos [getpos _veh select 0,getpos _veh select 1,(getpos _veh select 2) -1];
				sleep 0.1;
				if (_obj isKindOf "Strategic") then {_obj_fall = [_obj] spawn BTC_l_obj_fall;};
			};
			case (_height < 2):
			{
				_obj setpos (player modelToWorld [-2,-4,0]);
			};
		};
	};
	sleep 1;
	BTC_action_cargo = false;
};
BTC_l_release =
{
	BTC_l_dragging = false;
};
BTC_l_drag =
{
	private ["_drag","_veh"];
	_array = nearestObjects [player, BTC_def_drag, 5];
	if (count _array > 0) then {_drag = _array select 0;};
	if (isNull _drag) exitWith {};
	if (format ["%1", _drag getVariable "BTC_cannot_drag"] == "1") exitWith {hint "You can't drag this object!";};
	if (_drag distance player > 4) exitWith {hint "Too distance from the object!";};
	if (BTC_l_dragging) exitWith {hint "You can't drag more than one object!";};
	if (format ["%1", _drag getVariable "BTC_being_drag"] == "1") exitWith {hint "You can't drag this object! it's being dragged!";};
	BTC_l_dragging = true;
	_drag setvariable ["BTC_Being_Drag",1,true];
	BTC_display_EH_l = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 45) then {_anim = [] spawn {sleep 0.01;player switchMove ""acinpknlmstpsraswrfldnon"";};};"];			
	player playMove "acinpknlmstpsraswrfldnon";
	_drag attachto [player,[0,2,0.2]];
	sleep 0.1;
	if ((position _drag select 2) < - 0.5) then {_drag attachto [player,[0,1,1.2]];};
	_release = player addaction [("<t color=""#00FF00"">") + ("Release") + "</t>",BTC_dir_action,[[],BTC_l_release],7,true,false,"","true"];
	WaitUntil {!Alive player || ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))};
	_act  = 0;
	While {BTC_l_dragging && vehicle player == player && Alive player && ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))} do
	{
		/*_array = nearestObjects [player, BTC_def_vehicles, 5];
		if (count _array == 0) then {_veh = objNull;};
		if (count _array > 0 && _veh != _array select 0) then 
		{
			_veh = _array select 0;
			_name_veh        = getText (configFile >> "cfgVehicles" >> typeof _veh >> "displayName");
			_text_action     = ("<t color=""#ED2744"">" + "Load in " + (_name_veh) + "</t>");
			_load = player addAction [_text_action,BTC_dir_action, [[_veh],BTC_l_load], 7, true, true];
			_act  = 1;
		};
		if (count _array == 0 && _act == 1) then {player removeAction _load;_act = 0;};*/
		sleep 0.1;
	};
	player playMoveNow "AmovPknlMstpSrasWrflDnon";BTC_l_dragging = false;
	player removeAction _release;//player removeAction _load;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",BTC_display_EH_l];
	if !(isNull _drag) then 
	{
		detach _drag;
		//_rel_pos = player modelToWorld [0,1,0];
		//BTC_cargo_selected setpos _rel_pos;
		_drag setvariable ["BTC_Being_Drag",0,true];
	};
};