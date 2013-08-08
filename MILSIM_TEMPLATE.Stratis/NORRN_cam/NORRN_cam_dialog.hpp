// norrn_cam_dialog.hpp
// norrin, APRIL 2013

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

class NORRN_cam_dialog 
{
	idd = 99130;   
	movingEnable = true;   
	
	class controls {
		class NORRNRscText_norrnCam
		{
			idc = -1;
			x = 0;
			y = 0;
			h = 0;
			w = 0;
			style = 0;
			type = 0;
			shadow = 1;
			colorShadow[] = {0,0,0,0.5};
			font = "PuristaMedium";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
			colorText[] = {1,1,1,1.0};
			colorBackground[] = {0,0,0,0};
			linespacing = 1;
			text = "";
		};
		class NORRNRscActiveText_norrnCam 
		{
			idc = -1;
			style = 0;
			x = 0;
			y = 0;
			h = 0;
			w = 0;
			font = "PuristaMedium";
			type = 11;
			shadow = 2;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
			color[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorActive[] = {0.3,0.4,0,1};
			soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
			soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
			soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
			text = "";
			default = 0;
		};
		class NORRNRscControlsGroup_norrnCam
		{
			type = 15;
			idc = -1;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			shadow = 0;
			style = 16;
			class VScrollbar
			{
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
				shadow = 0;
				color[] = {1, 1, 1, 1};
			};
			class HScrollbar
			{
				height = 0.028;
				shadow = 0;
				color[] = {1, 1, 1, 1};
			};
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			class Controls{};
		};
		class NORRNRscCombo_norrnCam 
		{
			style = 16;
			type = 4;
			idc = -1;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			shadow = 0;
			colorSelect[] = {0,0,0,1};
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,1};
			colorSelectBackground[] = {1,1,1,0.7};
			colorScrollbar[] = {1,0,0,1};
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
			wholeHeight = 0.45;
			color[] = {1,1,1,1};
			colorActive[] = {1,0,0,1};
			colorDisabled[] = {1,1,1,0.25};
			font = "PuristaMedium";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			soundSelect[] = { "", 0, 1 };
			soundExpand[] = { "", 0, 1 };
			soundCollapse[] = { "", 0, 1 };
			maxHistoryDelay = 0;
		};
		class NORRNmouseHandler_norrnCam : NORRNRscControlsGroup_norrnCam 
		{			
			onMouseMoving = "[""MouseMoving"",_this] call MouseEvents";
			onMouseButtonDown = "[""MouseButtonDown"",_this] call MouseEvents";
			onMouseButtonUp = "[""MouseButtonUp"",_this] call MouseEvents";
			onMouseZChanged = "[""MouseZChanged"",_this] call MouseEvents";			
			idc = 2501;
			type = 15;
			style = 0;
			x = 0.0; y = 0.0;
			w = 1.0; h = 1.0;			
			colorBackground[] = {0.2, 0.0, 0.0, 0.0};
				
			class VScrollbar 
			{
				color[] = {1, 1, 1, 1};
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = false;			
			};
			class HScrollbar 
			{
				color[] = {1, 1, 1, 1};
				height = 0.028;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = false;	
			};
			class ScrollBar 
			{
				color[] = {1, 1, 1, 0.6};
				colorActive[] = {1, 1, 1, 1};
				colorDisabled[] = {1, 1, 1, 0.3};
				thumb = "\ca\ui_f_data\data\gui\cfg\Scrollbar\thumb_ca.paa";
				arrowFull = "\ca\ui_f_data\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
				arrowEmpty = "\ca\ui_f_data\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
				border = "\ca\ui_f_data\data\gui\cfg\Scrollbar\border_ca.paa";
			};
			
			class Controls {};
		};
		class CAM_LIST: NORRNRscCombo_norrnCam  {
			idc = 10004;
			x = 0.0; y = 0.0;
			w = 0.0; h = 0.0;
			//sizeEx = 0.02; 
		};
		class FRIEND_LIST: NORRNRscCombo_norrnCam  {
			idc = 10005;
			x = 0.0; y = 0.0;
			w = 0.0; h = 0.0;
			//sizeEx = 0.02; 
		};
	};

};

