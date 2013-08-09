//-MILSIM LoadOut Menu
#define IDC_MILSIMLOADOUTMENU_CTR_LOADOUT_BACKGROUNG 				1000
#define IDC_MILSIMLOADOUTMENU_LBL_MILSIM_LOADOUTMENU_TITLE 			1001
#define IDC_MILSIMLOADOUTMENU_LBL_MILSIM_LOADOUTMENU_TEAM			1002
#define IDC_MILSIMLOADOUTMENU_LST_MILSIM_LOADOUTMENU_CLASSES		1500
#define IDC_MILSIMLOADOUTMENU_BTN_MILSIM_LOADOUTMENU_CHOOSE_TEAM	1600
#define IDC_MILSIMLOADOUTMENU_BTN_MILSIM_LOADOUTMENU_LOAD			1601
#define IDC_MILSIMLOADOUTMENU_BNT_MILSIM_LOADOUTMENU_CLOSE			1602
#define IDC_MILSIMLOADOUTMENU_CB_MILSIM_LOADOUTMENU_TEAM			2100

class MILSIM_LoadOutMenu {
	idd = -1;                      
	movingEnable = 1;       
	controlsBackground[] = { ctr_loadout_backgroung };    
	objects[] = { };               
	controls[] = { lbl_MILSIM_LoadOutMenu_Title,cb_MILSIM_LoadOutMenu_Team,cb_MILSIM_LoadOutMenu_Team,btn_MILSIM_LoadOutMenu_choose_team,lst_MILSIM_LoadOutMenu_classes,btn_MILSIM_LoadOutMenu_Load,bnt_MILSIM_LoadOutMenu_close, lbl_MILSIM_LoadOutMenu_team }; 

			class ctr_loadout_backgroung: RscText
			{
				idc = 1000;
				x = 0.3375 * safezoneW + safezoneX;
				y = 0.1 * safezoneH + safezoneY;
				w = 0.2925 * safezoneW;
				h = 0.64 * safezoneH;
				colorBackground[] = {0,0,0,0.8};
			};
			class lbl_MILSIM_LoadOutMenu_Title: RscText
			{
				idc = 1001;
				text = "MILSIM LoadOut Menu"; //--- ToDo: Localize;
				x = 0.3375 * safezoneW + safezoneX;
				y = 0.1 * safezoneH + safezoneY;
				w = 0.2 * safezoneW;
				h = 0.04 * safezoneH;
			};
			class cb_MILSIM_LoadOutMenu_Team: RscCombo
			{
				idc = 2100;
				x = 0.355 * safezoneW + safezoneX;
				y = 0.164 * safezoneH + safezoneY;
				w = 0.1475 * safezoneW;
				h = 0.032 * safezoneH;
			};
			class btn_MILSIM_LoadOutMenu_choose_team: RscButton
			{
				idc = 1600;
				text = "Select"; //--- ToDo: Localize;
				x = 0.5125 * safezoneW + safezoneX;
				y = 0.164 * safezoneH + safezoneY;
				w = 0.095 * safezoneW;
				h = 0.032 * safezoneH;
				Action = "[] call MILSIM_fnc_LoadOutMenu_FillClasses;";
			};
			class lst_MILSIM_LoadOutMenu_classes: RscListbox
			{
				idc = 1500;
				x = 0.35 * safezoneW + safezoneX;
				y = 0.264 * safezoneH + safezoneY;
				w = 0.2625 * safezoneW;
				h = 0.396 * safezoneH;
			};
			class btn_MILSIM_LoadOutMenu_Load: RscButton
			{
				idc = 1601;
				text = "Load"; //--- ToDo: Localize;
				x = 0.425 * safezoneW + safezoneX;
				y = 0.68 * safezoneH + safezoneY;
				w = 0.0833333 * safezoneW;
				h = 0.033 * safezoneH;
				action = "[] call MILSIM_fnc_LoadOutMenu_Load;closedialog 0;";
			};
			class bnt_MILSIM_LoadOutMenu_close: RscButton
			{
				idc = 1602;
				text = "Close"; //--- ToDo: Localize;
				x = 0.525 * safezoneW + safezoneX;
				y = 0.68 * safezoneH + safezoneY;
				w = 0.0833333 * safezoneW;
				h = 0.033 * safezoneH;
				action = "closedialog 0;"
			};
			class lbl_MILSIM_LoadOutMenu_team: RscText
			{
				idc = 1002;
				text = "No Team Selected"; //--- ToDo: Localize;
				x = 0.35 * safezoneW + safezoneX;
				y = 0.2 * safezoneH + safezoneY;
				w = 0.15 * safezoneW;
				h = 0.08 * safezoneH;
			};

};
