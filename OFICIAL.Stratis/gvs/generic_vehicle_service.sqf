/*=================================================================================================================
  Generic Vehicle Service by Jacmac

  Version History:
  A - Initial Release 3/22/2013
  B - Updated documentation, no script alterations 3/26/2013
  C - Revised trigger reuse handling, now server controlled 4/21/2013

  Requirements:
  gvs_watcher.sqf                       		Delays use (reuse) of service points
  cfg_lookup.sqf                        		Utility functions
  simple_text_control.sqf               		Display/Dialog control for structured text
  colors_include.hpp                    		Color definitions
  control_include.hpp							Standard control includes
  stc_include.hpp								Simple text display control definitions
  
  
  Your mission's description.ext:
  Add #include "gvs\colors_include.hpp" to description.ext
  Add #include "gvs\control_include.hpp" to description.ext
  Add #include "gvs\stc_include.hpp" to description.ext
  Add #include "gvs\sound_include.hpp" to description.ext (Arma 3 bugged currently, but included anyway)
  
  Your mission's init.sqf:
  Add the following lines:

	call compile preProcessFile "gvs\cfg_lookup.sqf";
	call compile preProcessFile "gvs\simple_text_control.sqf";
	
	if (isNil "Public_Banned_Vehicle_Service_List") then {Public_Banned_Vehicle_Service_List = []};
	if (isNil "Public_GVS_Delay") then {Public_GVS_Delay = 1000};
	
	//add lines like the lines below for your triggers
	if (isNil "Public_Veh1") then {Public_Veh1 = 0}; //Example trigger named Veh1
	if (isNil "Public_Air1") then {Public_Air1 = 0}; //Example trigger named Air1
	
	//this is required:
	if (isServer) then {execVM "gvs\gvs_watcher.sqf"};

  Features:
  -Rearms, Repairs, and Refuels Land, Air, or both types as desired
  -Wait times are adjustable and refuel/repair occurs only as needed,
    for example 50% repair is 5x longer than 10% repair. That could be
    50 seconds vs 10 seconds or 5 minutes vs 1 minute.
  -Uses display names rather than type names in messages to players.
  -Use this with a trigger placed on the map (see below).
  -Displays live activity in a dialog control rather than messages
    going out through vehicle chat.
  -gvs_watcher disallows a vehicle from re-using any service point for a 
  	specified period.
  -Triggers on player being the driver of the vehicle, but the player 
  	does not need to remain	in the vehicle while it is being serviced.
  -Introducing sounds into this version, however a known bug in Arma 3 
  	prevents the sound fx from working at this time.

  Trigger Information:
    1. Create a trigger of arbitrary shape and size.
    2. Name the trigger as desired (GVS_0 and ServicePoint1 in examples below).
    3. Set trigger text as desired.
    4. Set trigger type to NONE.
    5. Set trigger activation to ANYBODY, REPEATEDLY, PRESENT
    6. Set trigger condition to one of these three possibilities depending on which vehicle type(s) will be allowed:
    
    	Public_*triggername* == 0 and (thislist select 0) isKindOf "LandVehicle" and player == driver (thislist select 0)
    	Public_*triggername* == 0 and (thislist select 0) isKindOf "Air" and player == driver (thislist select 0)
    	Public_*triggername* == 0 and (thislist select 0) isKindOf "Air" or (thislist select 0) isKindOf "LandVehicle) and player == driver (thislist select 0)

		where:
	"Public_*triggername*":	is a public variable defined in Init.sqf, replace *triggername* with the name of the trigger (required)	

    7. Set trigger on act to:
    
    Public_*triggername* = 1;
    publicVariable "Public_*triggername*";
    _nul = ["Public_*triggername*", (thislist select 0), getPos *triggername*,*maxdistance*,10,1,1,1,1] execVM "gvs\generic_vehicle_service.sqf"

        where:
    "Public_*triggername*":	is a public variable defined in Init.sqf, replace *triggername* with the name of the trigger (required)
    (thislist select 0):    is used by this script to identify the object (required)
    getPos *triggername*:   replace *triggername* with the name of the trigger (required)
    *maxdistance*:          is a number in meters. If the triggering vehicle strays past this distance, the script will abort (optional, defaults to 6)
    *maxheight*:			is a number in meters. If the triggering vehicle strays past this height, the script will abort (optional, defaults to 4)
    *startdelay*:           is a number in seconds. The servicing will begin after this delay, gives player time to exit the trigger (optional, defaults to 10)
    *fueltime*:             is a number in seconds. Each percent of repair or refuel needed will take this long to complete (optional, defaults to 2)
    *repairtime*:           is a number in seconds. Each percent of repair or refuel needed will take this long to complete (optional, defaults to 10)
    *magazinereloadtime*:   is a number in seconds. Each magazine in the vehicle or turret will take this long to reload (optional, defaults to 10)

        Trigger On Act Examples:
        Public_GVS_0 = 1; publicVariable "Public_GVS_0"; _nul = ["Public_GVS_0", (thislist select 0), getPos GVS_0, 10, 6, 5, 0.1, 2, 15] execVM "gvs\generic_vehicle_service.sqf"

        For a trigger named GVS_0,
            10 meter maximum distance from the trigger,
            6 meter maximum height over the trigger,
            5 second start delay,
            1/10 seconds per percentage of refuel needed,
            2 seconds per percentage of repair needed,
            15 seconds per magazine reload.

        Public_ServicePoint1 = 1; publicVariable "Public_ServicePoint1"; _nul = ["Public_ServicePoint1", (thislist select 0), getPos ServicePoint1] execVM "gvs\generic_vehicle_service.sqf"

        For a trigger named ServicePoint1,
            use default values for everything else.

  Display Information:
  The display location and background color can be changed by altering the _display_Settings variable
  Text colors can also be altered by changing the constants through out the code prefixed with 'RGB'
  Colors can be found in colors_include.hpp

  Additional Notes:
  MAJOR NEW REQUIREMENT: Your vehicles must be uniquely named. GVS uses the names of vehicles to control re-use of a GVS trigger.
  This means if you put 10 Hunters on the map all named "BigHunter1", the first one to use a GVS will lock all of the others out
  until the re-use timer expires for "BigHunter1". For script spawned vehicles you will need to implement something like this if
  you want them to be able to use a GVS trigger:
  
  Example 1:
  	_kh60_Pos = [3962,4618];
  	_veh = "O_Ka60_F" createVehicle _kh60_Pos;
	_varName="ka60_1";							// <----This must be unique per vehicle
	_veh SetVehicleVarName _varName;
	_veh Call Compile Format ["%1=_this ; PublicVariable ""%1""",_varName];
	
  Example 2:
	_xloc = (floor ((random 100) + 3950));
	_yloc = (floor ((random 50) + 4550));
	_veh = "B_Quadbike_F" createVehicle [_xloc,_yloc];
	Global_QUAD = Global_QUAD + 1;
	_varName=("Quadbike_" + (str Global_QUAD)); // <----This must be unique per vehicle
	_veh SetVehicleVarName _varName;
	_veh Call Compile Format ["%1=_this ; PublicVariable ""%1""",_varName];
  
  Long term re-use of a trigger is controlled per vehicle instead of per player, this is a major change from the previous version.
  Each trigger you set up with GVS needs a public variable associated with it and these need to be initialized in init.sqf.
  The public variables prevent the GVS trigger from being immediately used by anyone or any vehicle on the server, while
  it is currently in use. This prevents scenarios where one player triggers GVS, then get out of a vehicle and another
  player gets in the same vehicle and causes a second triggering of the GVS (this was seen to cause problems).
  
  The default time for re-using a trigger has been changed to 200 seconds in gvs_watcher.sqf. A player can possibly trigger
  two or more vehicles to use various GVS triggers for different vehicle if they are all in close proximity, this can mean
  that the display of the information will get a little wonky, but everything will function normally as far as the vehicles
  rearming and repairing.

=================================================================================================================*/

#include "colors_include.hpp"
scopeName "main";

private [   "_turretCount",             //Count of turrets on vehicle
            "_vehicleMagazines",        //Array of vehicle magazine names
            "_vehicleMagazinesCount",   //Count of vehicle magazines
            "_turretMagazines",         //Array of turret magazine names
            "_turretMagazinesCount",    //Count of turret magazines
            "_vehicleName",             //Display name of vehicle
            "_oVehicle",                //Vehicle object passed to this script (required)
            "_triggerPos",              //Position of trigger passed to this script (required)
            "_maxDistance",             //Distance from trigger where the script will abort
            "_maxHeight",				//Height above trigger where the script will abort
            "_per_fuel_time",           //Time vehicle must wait per each percentage of fuel
            "_per_repair_time",         //Time vehicle must wait per each percentage of repair
            "_per_magazine_time",       //Time vehicle must wait per magazine for reloading
            "_vehicleType",             //Vehicle type, used for lookups
            "_display_Settings",        //Array containing display control information
            "_triggerVariable", 		//Variable holding the name of a public trigger control variable
            "_vName"					//Vehicle actual name
            ];

_triggerVariable = _this select 0;
_vName = vehicleVarName (_this select 1);
_gtfo = 0;
{
	if (_vName == _x) then {_gtfo = 1};
}forEach Public_Banned_Vehicle_Service_List;
if (_gtfo == 1) exitWith 
{
	sleep 1;
	call compile format ["%1 = 0", _triggerVariable]; 
	call compile format ["publicVariable '%1'", _triggerVariable];	
};

_display_Settings = [ARRAY_PART_DIRT,safeZoneX + 0.02,safeZoneY + 0.5,0.4,0.4];

func_GetTurretMagazines =
{
    private ["_config","_magazines","_magcount","_magnames","_mag","_turretnumber","_vtype"];
    _vtype = _this select 0;
    _turretnumber = if (count _this > 1) then {_this select 1} else {0};
    _config = (configFile >> "CfgVehicles" >> _vtype >> "Turrets") select _turretnumber;
    _magazines = getArray(_config >> "magazines");
    _magcount = count _magazines;
    _magnames = [];
    _mag = 0;
    {
        _magnames = _magnames + [(_magazines select _mag) call Cfg_Lookup_Magazine_GetName];
        _mag = _mag + 1;
    } forEach _magazines;
    [_magcount,_magnames]
};

func_GetVehicleMagazines =
{
    private ["_magazines","_magcount","_magnames","_mag","_vtype"];
    _vtype = _this;
    _magazines = _vtype call Cfg_Lookup_Vehicle_GetMagazines;
    _magcount = count _magazines;
    _magnames = [];
    _mag = 0;
    {
        _magnames = _magnames + [(_magazines select _mag) call Cfg_Lookup_Magazine_GetName];
        _mag = _mag + 1;
    } forEach _magazines;
    [_magcount,_magnames]
};

func_GenActionMsg =
{
    private ["_action","_genmsg"];
    _action = _this select 0;
    _genmsg = "<br />";
    _genmsg = _genmsg + ([_vehicleName,RGB_GOLDENROD] call stc_Title);
    _genmsg = _genmsg + ([_action,RGB_TAN] call stc_Title);
    _genmsg = _genmsg + (["    Repair Needed: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);
    _genmsg = _genmsg + ([(str _damageToRepair) + "%",RGB_LIMEGREEN] call stc_LineLeft);
    _genmsg = _genmsg + (["      Fuel Needed: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);
    _genmsg = _genmsg + ([(str _gasToFill) + "%",RGB_LIMEGREEN] call stc_LineLeft);
    if (_vehicleMagazinesCount > 0 ) then
    {
        _genmsg = _genmsg + ([" Vehicle Magazines: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);
        _genmsg = _genmsg + ([_vehicleMagazinesCount,RGB_LIMEGREEN] call stc_LineLeft);
        {
            _genmsg = _genmsg + ([_x ,RGB_RED] call stc_LineCenter);
        } forEach _vehicleMagazines;
    };
    if (_turretMagazinesCount > 0 ) then
    {
        _genmsg = _genmsg + ([" Turret Magazines: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);
        _genmsg = _genmsg + ([_turretMagazinesCount,RGB_LIMEGREEN] call stc_LineLeft);
        {
            _genmsg = _genmsg + ([_x ,RGB_RED] call stc_LineCenter);
        } forEach _turretMagazines;
    };
    _genmsg = _genmsg + (["Total Service Completion ETA: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);
    _genmsg = _genmsg + ([(str _serviceEta) + " Seconds",RGB_LIMEGREEN] call stc_LineLeft);
    _genmsg
};

func_Abort =
{
    _abort = 1;
    _msg = "<br />";
    _msg = _msg + ([_vehicleName,RGB_GOLDENROD] call stc_Title);
    _msg = _msg + (["Service Point Exited",RGB_KHAKI] call stc_Title);
    _msg = _msg + "<br />";
    _msg = _msg + (["Servicing Aborted...",RGB_RED] call stc_Title);
    _msg call stc_DisplayWrite;
    sleep 1;
    call compile format ["%1 = 0", _triggerVariable]; 
	call compile format ["publicVariable '%1'", _triggerVariable];
    call stc_DisplayHide;
    sleep 0.1;
};

_abort = 0;
_triggerVariable = _this select 0;
_oVehicle = _this select 1;
//_oVehicle setDamage 0.10; //for testing
//_oVehicle setFuel 0.7;    //for testing
_triggerPos = _this select 2;
_maxDistance = if (count _this > 3) then { _this select 3 } else { 6 };
_maxHeight = if (count _this > 4) then { _this select 4 } else { 4 };
_serviceStartDelay = if (count _this > 5) then { _this select 5 } else { 10 };
_per_fuel_time = if (count _this > 6) then { _this select 6 } else { 2 };
_per_repair_time = if (count _this > 7) then { _this select 7 } else { 10 };
_per_magazine_time = if (count _this > 8) then { _this select 8 } else { 10 };
_gasToFill = round (abs (fuel _oVehicle - 1) * 100);
_damageToRepair = round ((damage _oVehicle) * 100);

_vehicleType = typeOf _oVehicle;
_vehicleName = _vehicleType call Cfg_Lookup_Vehicle_GetName;

_returnArray = [_vehicleType] call func_GetTurretMagazines;
_turretMagazinesCount = _returnArray select 0;
_turretMagazines = _returnArray select 1;

_returnArray = _vehicleType call func_GetVehicleMagazines;
_vehicleMagazinesCount = _returnArray select 0;
_vehicleMagazines = _returnArray select 1;

_serviceEta =   (_turretMagazinesCount * _per_magazine_time) +
                (_vehicleMagazinesCount * _per_magazine_time) +
                (_gasToFill * _per_fuel_time) +
                (_damageToRepair * _per_repair_time);

call disableSerialization;
if ((_oVehicle distance player) < 10) then { _display_Settings call stc_DisplayShow; };

_staticmsg = ["Service Point Entered"] call func_GenActionMsg;
_staticmsg = _staticmsg + "<br />";
_staticmsg = _staticmsg + (["Service will start in: ",RGB_LIGHTSTEELBLUE] call stc_PartLeft);

while { _serviceStartDelay > 0 } do
{
    _startDelay = str (round (_serviceStartDelay)) + " Seconds";
    _currentDist = (getPos _oVehicle) distance _triggerPos;
    _distanceToExit = str (_maxDistance - _currentDist);
    _dynamicmsg = [_startDelay,RGB_LIMEGREEN] call stc_LineCenter;
    if (_currentDist > _maxDistance or (getPos _oVehicle select 2) > _maxHeight) then
    {
        call func_Abort;
        breakTo "main";
    };
    _msg = _staticmsg + _dynamicmsg;
    _msg call stc_DisplayWrite;
    sleep 0.1;
    _serviceStartDelay = _serviceStartDelay - 0.1;
};

if (_abort == 0) then
{
    _oVehicle setFuel 0;
    if (_damageToRepair > 0) then
    {
    	["Repairing", 10, getPos _oVehicle] spawn Sound_Loop;
        _staticmsg = ["Repairing Damage"] call func_GenActionMsg;
        _staticmsg = _staticmsg + "<br />";
        _staticmsg = _staticmsg + (["Reparing: ",RGB_SKYBLUE] call stc_PartLeft);
        for "_crunch" from 0 to _damageToRepair do
        {
            _damagetofix = str (100 - _damageToRepair + _crunch) + "%";
            _dynamicmsg = [_damagetofix,RGB_LIMEGREEN] call stc_LineLeft;
            _msg = _staticmsg + _dynamicmsg;
            _msg call stc_DisplayWrite;
            sleep _per_repair_time;
        };
        _serviceEta = _serviceEta - _damageToRepair * _per_repair_time;
        _damageToRepair = 0;
        _oVehicle setDamage 0;
    };
    if (_gasToFill > 0) then
    {
    	["Fueling", 10, getPos _oVehicle] spawn Sound_Loop;
        _staticmsg = ["Adding Fuel"] call func_GenActionMsg;
        _staticmsg = _staticmsg + "<br />";
        _staticmsg = _staticmsg + (["Fueling: ",RGB_SKYBLUE] call stc_PartLeft);
        for "_gas" from 0 to _gasToFill do
        {
            _gastoadd = str (100 - _gasToFill + _gas) + "%";
            _dynamicmsg = [_gastoadd,RGB_LIMEGREEN] call stc_LineLeft;
            _msg = _staticmsg + _dynamicmsg;
            _msg call stc_DisplayWrite;
            sleep _per_fuel_time;
        };
        _serviceEta = _serviceEta - _gasToFill * _per_fuel_time;
        _gasToFill = 0
    };
    if (_vehicleMagazinesCount > 0 ) then
    {
        _mag = 0;
        {
        	["Reloading", 10, getPos _oVehicle] spawn Sound_Loop;
            _msg = ["Reloading Vehicle Magazines"] call func_GenActionMsg;
            _msg = _msg + "<br />";
            _msg = _msg + (["Reloading: ",RGB_SKYBLUE] call stc_PartLeft);
            _msg = _msg + ([_x,RGB_RED] call stc_LineLeft);
            _vehicleMagazines set [_mag, " "];
            _serviceEta = _serviceEta - _per_magazine_time;
            _vehicleMagazinesCount = _vehicleMagazinesCount - 1;
            _mag = _mag + 1;
            _msg call stc_DisplayWrite;
            sleep _per_magazine_time;
        } forEach _vehicleMagazines;
    };
    if (_turretMagazinesCount > 0 ) then
    {
        _mag = 0;
        {
        	["Reloading", 10, getPos _oVehicle] spawn Sound_Loop;
            _msg = ["Reloading Turret Magazines"] call func_GenActionMsg;
            _msg = _msg + "<br />";
            _msg = _msg + (["Reloading:",RGB_SKYBLUE] call stc_PartLeft);
            _msg = _msg + ([_x,RGB_RED] call stc_LineLeft);
            _turretMagazines set [_mag, " "];
            _serviceEta = _serviceEta - _per_magazine_time;
            _turretMagazinesCount = _turretMagazinesCount - 1;
            _mag = _mag + 1;
            _msg call stc_DisplayWrite;
            sleep _per_magazine_time;
        } forEach _turretMagazines;
    };
    [Public_Banned_Vehicle_Service_List, _vName] call BIS_fnc_arrayPush;
    publicVariable "Public_Banned_Vehicle_Service_List";
    sleep 0.1;
    _msg = "<br />";
    _msg = _msg + ([_vehicleName,RGB_GOLDENROD] call stc_Title);
    _msg = _msg + "<br />";
    _msg = _msg + (["Servicing Completed!",RGB_LIMEGREEN] call stc_Title);
    _msg = _msg + "<br />";
    _msg = _msg + (["All Service Points Are Now Unavailable To This Vehicle For:", RGB_KHAKI] call stc_Title);
    _msg = _msg + ([(str Public_GVS_Delay) + " Seconds",RGB_RED] call stc_Title);
    _msg call stc_DisplayWrite;  
    _oVehicle setFuel 1;
    _oVehicle setVehicleAmmo 1;
    sleep 10;
    call compile format ["%1 = 0", _triggerVariable]; 
	call compile format ["publicVariable '%1'", _triggerVariable];
    call stc_DisplayHide;
    sleep 0.1;
};