/*=================================================================================================================
  Simple Text Control by Jacmac

  Version History:
  A - Initial Release 3/16/2013

  Requirements:
  stc_include.hpp in description.ext

  Features:
  -Allows other scripts to use friendly calls for formatted text in a display control
  -Structured text helper functions for building strings

  Functions:

  stc_DisplayShow: Turns on the display control defined in stc_include.hpp accepts parameters:
  _x:   0 to 1 Absolute x position or safeZoneX relative x postion of the display control (recommend using safeZoneX + 0 to 1)
  _y:   0 to 1 Absolute y position or safeZoneY relative y postion of the display control (recommend using safeZoneY + 0 to 1)
  _h:   0 to 1 Absolute height of the display control
  _w:   0 to 1 Absolute width of the display control

  Example:
  [safeZoneX + 0.1,safeZoneY + 0.5,0.4,0.4] call stc_DisplayShow;
  will display the dialog on the left side halfway down as a square box. The box will be blank until

  Use in init.sqf:
  call compile preProcessFile "simple_text_control.sqf";

=================================================================================================================*/
#include "colors_include.hpp"

stc_DisplayShow =
{
    private["_x", "_y", "_h", "_w", "_pos", "_control", "_disp"];
    cutRsc ["UC_ShowText_small","PLAIN",0];
    if (count _this > 0) then
    {
        _disp = uiNamespace getVariable "d_UC_ShowText_small";
        _control = _disp displayCtrl 301;
        _control ctrlSetBackgroundColor (_this select 0);
        _x = if (count _this > 1) then {_this select 1} else {-1};
        _y = if (count _this > 2) then {_this select 2} else {-1};
        _h = if (count _this > 3) then {_this select 3} else {-1};
        _w = if (count _this > 4) then {_this select 4} else {-1};
        _pos = ctrlPosition _control;
        if (_x != -1) then {_pos set [0,_x]};
        if (_y != -1) then {_pos set [1,_y]};
        if (_w != -1) then {_pos set [2,_w]};
        if (_h != -1) then {_pos set [3,_h]};
        _control ctrlSetPosition _pos;
        _control ctrlCommit 0;
        waituntil {ctrlCommitted _control};
    };
};

stc_DisplayHide =
{
    cutRsc ["UC_HideText_Small","PLAIN",0];
};

stc_DisplayWrite =
{
    private["_disp"];
    _disp = uiNamespace getVariable "d_UC_ShowText_small";
    _control = _disp displayCtrl 301;
    _control ctrlSetStructuredText parseText _this;
    _control ctrlCommit 0;
    waituntil {ctrlCommitted _control};
};

stc_LineLeft =
{
    private["_msg"];
    _msg = format ["<t color=%2 align=left>%1</t><br />",_this select 0, _this select 1];
    _msg
};

stc_PartLeft =
{
    private["_msg"];
    _msg = format ["<t color=%2 align=left>%1</t>",_this select 0, _this select 1];
    _msg
};


stc_LineRight =
{
    private["_msg"];
    _msg = format ["<t color=%2 align=right>%1</t><br />",_this select 0, _this select 1];
    _msg
};

stc_LineCenter =
{
    private["_msg"];
    _msg = format ["<t color=%2 align=center>%1</t><br />",_this select 0, _this select 1];
    _msg
};

stc_LineBreak =
{
    private["_msg"];
    _msg = "<br />";
    _msg
};

stc_PartCenter =
{
    private["_msg"];
    _msg = format ["<t color=%2 align=center>%1</t>",_this select 0, _this select 1];
    _msg
};

stc_Title =
{
    private["_msg"];
    _msg =  format ["<t size='1.5' color=%2 align='center'>%1</t><br />",_this select 0, _this select 1];
    _msg
};


