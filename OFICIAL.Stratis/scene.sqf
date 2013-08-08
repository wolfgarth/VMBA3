titlecut [" ","BLACK IN",1];
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];

playmusic "Overdose";

titletext ["GROO FRAMEWORK\nFeatures:\nMonsada's UPSMON\nBangabob's EOS\nFHQ Task Tracker\n=BTC= Logistics","PLAIN"];

;comment "22:35:35";
_camera camPrepareTarget [20135.24,92466.56,-35354.58];
_camera camPreparePos [2624.02,607.07,43.85];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "22:36:26";
_camera camPrepareTarget [20135.24,92466.56,-35354.53];
_camera camPreparePos [2625.06,606.12,16.45];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

titletext ["A Mission By\n The VMB S3 Team\nPvt.OfKings - Mission Editing\nPvt.Andrade - Mission Scripting","PLAIN"];

;comment "2:13:25";
_camera camPrepareTarget [-15842.40,93639.35,-43734.88];
_camera camPreparePos [3227.34,5771.25,31.72];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "2:14:33";
_camera camPrepareTarget [-15842.40,93639.35,-43735.17];
_camera camPreparePos [2890.18,5986.87,33.57];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

titletext ["FEATURING:\nMILSIM Units by Maj.BlackHawk\nLoadOut Scripts by Col.Viper","PLAIN"];

;comment "21:17:08";
_camera camPrepareTarget [-43394.66,92383.33,-16030.24];
_camera camPreparePos [2450.24,4990.55,1.60];
_camera camPrepareFOV 0.022;
_camera camCommitPrepared 0;

;comment "21:17:37";
_camera camPrepareTarget [-43394.66,92383.33,-16029.91];
_camera camPreparePos [2450.24,4990.55,1.60];
_camera camPrepareFOV 0.490;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

titletext ["OPERACAO SOCRATES","PLAIN"];

;comment "21:19:02";
_camera camPrepareTarget [87277.45,-2955.69,-52205.86];
_camera camPreparePos [2435.65,4992.61,13.51];
_camera camPrepareFOV 0.490;
_camera camCommitPrepared 0;

;comment "21:19:48";
_camera camPrepareTarget [102012.46,-4336.14,855.45];
_camera camPreparePos [2450.04,4980.68,15.95];
_camera camPrepareFOV 0.490;
_camera camCommitPrepared 8;
waitUntil {camCommitted _camera;};

;comment "21:20:33";
_camera camPrepareTarget [102176.81,-2204.58,1848.99];
_camera camPreparePos [2450.04,4980.68,15.95];
_camera camPrepareFOV 0.012;
_camera camCommitPrepared 7;
waitUntil {camCommitted _camera;};

titletext ["Destroy the enemy War Resources!","PLAIN DOWN"];

;comment "21:23:53";
_camera camPrepareTarget [-5521.71,104111.53,-9287.08];
_camera camPreparePos [2925.04,4917.96,31.58];
_camera camPrepareFOV 0.051;
_camera camCommitPrepared 0;

;comment "21:24:36";
_camera camPrepareTarget [-5521.71,104111.53,-9286.97];
_camera camPreparePos [2925.04,4917.96,4.15];
_camera camPrepareFOV 0.621;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

;comment "21:25:16";
_camera camPrepareTarget [-5543.79,104372.07,-5952.38];
_camera camPreparePos [2885.28,4914.57,9.01];
_camera camPrepareFOV 0.090;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

ActorOfficer switchmove "acts_PointingLeftUnarmed";

titletext ["Protect the Greek people!","PLAIN DOWN"];

;comment "2:20:44";
_camera camPrepareTarget [-71690.57,72006.45,7.18];
_camera camPreparePos [3241.70,5790.66,1.60];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "2:21:11";
_camera camPrepareTarget [-71690.57,72006.45,7.43];
_camera camPreparePos [3244.65,5793.99,1.63];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

titletext ["Kill the enemy Officer!","PLAIN DOWN"];

;comment "2:27:44";
_camera camPrepareTarget [-70604.03,-61631.38,7.38];
_camera camPreparePos [3247.25,5787.71,1.48];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "2:28:31";
_camera camPrepareTarget [-70915.36,-44813.22,-44009.57];
_camera camPreparePos [3254.48,5795.46,6.72];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};


ActorSoldier1 switchmove "AidlPercMstpSrasWrflDnon_G01_player";
ActorSoldier2 switchmove "AidlPercMstpSrasWrflDnon_G01_player";
ActorSoldier3 switchmove "AidlPercMstpSrasWrflDnon_G01_player";
ActorSoldier4 switchmove "AidlPercMstpSrasWrflDnon_G01_player";

;comment "2:29:36";
_camera camPrepareTarget [78224.55,-56229.50,-23016.22];
_camera camPreparePos [3238.72,5795.21,1.60];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;


ActorCaptive1 setcaptive false;
ActorCaptive2 setcaptive false;
ActorCaptive3 setcaptive false;
ActorCaptive4 setcaptive false;

ActorSoldier1 enableAI "ANIM";
ActorSoldier2 enableAI "ANIM";
ActorSoldier3 enableAI "ANIM";
ActorSoldier4 enableAI "ANIM";

sleep 10;

titletext ["Stop this Genocide!","PLAIN DOWN"];

;comment "2:46:27";
_camera camPrepareTarget [-68579.06,12977.31,-69187.45];
_camera camPreparePos [3247.37,5791.23,0.98];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "2:47:57";
_camera camPrepareTarget [-80743.45,-48472.29,7.32];
_camera camPreparePos [3252.52,5793.69,300.46];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

titletext ["GOOD LUCK!","PLAIN"];

sleep 10;

titletext ["IT'S TIME TO ROCK!","PLAIN"];

playmusic "Doom";

sleep 5;

;comment "10:49:00";
_camera camPrepareTarget [86321.19,53531.48,-7367.62];
_camera camPreparePos [2030.08,233.62,4.53];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "10:49:43";
_camera camPrepareTarget [86102.32,55011.61,-2795.29];
_camera camPreparePos [2428.09,491.71,10.74];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

;comment "10:50:18";
_camera camPrepareTarget [80250.61,60209.97,-19654.52];
_camera camPreparePos [2482.96,527.46,98.97];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "10:50:50";
_camera camPrepareTarget [78601.84,58944.62,-28272.76];
_camera camPreparePos [2549.20,578.26,62.01];
_camera camPrepareFOV 0.360;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "10:51:56";
_camera camPrepareTarget [-11770.49,-96908.76,16823.42];
_camera camPreparePos [2647.00,615.99,1.51];
_camera camPrepareFOV 0.021;
_camera camCommitPrepared 0;

;comment "10:52:08";
_camera camPrepareTarget [-11770.69,-96910.10,16823.66];
_camera camPreparePos [2647.00,615.99,1.51];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "10:53:07";
_camera camPrepareTarget [85368.41,56832.92,-407.13];
_camera camPreparePos [2655.46,633.24,1.57];
_camera camPrepareFOV 0.279;
_camera camCommitPrepared 0;

;comment "10:53:23";
_camera camPrepareTarget [85368.21,56832.70,-407.42];
_camera camPreparePos [2662.12,623.47,1.80];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "10:53:50";
_camera camPrepareTarget [-20712.05,-22657.63,-94332.98];
_camera camPreparePos [2646.32,635.67,5.75];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "10:54:10";
_camera camPrepareTarget [-20712.05,-22657.63,-94332.90];
_camera camPreparePos [2631.02,622.38,4.79];
_camera camPrepareFOV 1.892;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "10:22:38";
_camera camPrepareTarget [59628.88,71016.63,-41982.82];
_camera camPreparePos [2520.90,510.28,151.92];
_camera camPrepareFOV 0.888;
_camera camCommitPrepared 0;

sleep 2;

;comment "10:23:06";
_camera camPrepareTarget [59628.88,71016.63,-41982.90];
_camera camPreparePos [2520.97,510.22,151.92];
_camera camPrepareFOV 0.386;
_camera camCommitPrepared 0;

sleep 2;

;comment "10:23:20";
_camera camPrepareTarget [58697.54,69866.76,-44945.90];
_camera camPreparePos [2520.97,510.22,151.92];
_camera camPrepareFOV 0.120;
_camera camCommitPrepared 0;

sleep 2;


deletevehicle ActorOfficer;

deletevehicle ActorCaptive1;
deletevehicle ActorCaptive2;
deletevehicle ActorCaptive3;
deletevehicle ActorCaptive4;

deletevehicle ActorSoldier1;
deletevehicle ActorSoldier2;
deletevehicle ActorSoldier3;
deletevehicle ActorSoldier4;

deletevehicle ActorGar1;
deletevehicle ActorGar2;
deletevehicle ActorGar3;
deletevehicle ActorGar4;
deletevehicle ActorGar5;
deletevehicle ActorGar6;
deletevehicle ActorGar7;
deletevehicle ActorGar8;


_camera cameraeffect ["terminate","back"];
camdestroy _camera;


[str ("Operation Socrates") ,  str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("STRATIS")] spawn BIS_fnc_infoText;

exit;