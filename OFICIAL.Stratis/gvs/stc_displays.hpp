    class UC_ShowText_small
    {
        idd=-1;
        movingEnable=0;
        duration=10e30;
        fadein = 0;
        name="UC_ShowText1";
        onLoad = "uiNamespace setVariable ['d_UC_ShowText_small', _this select 0]";
        controls[]={"textUC_Show1"};
        class textUC_Show1 : UC_Display_small
        {
            idc = 301;
        };
    };
    class UC_HideText_small
    {
        idd=-1;
        movingEnable=0;
        duration=10e30;
        fadein = 0;
        name="UC_HideText1";
        onLoad = "uiNamespace setVariable ['d_UC_HideText_small', _this select 0]";
        controls[]={"textUC_Hide1"};
        class textUC_Hide1 : UC_HideDisplay_Small
        {
            idc = 301;
        };
    };
