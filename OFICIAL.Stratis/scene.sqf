titlecut [" ","BLACK IN",1];
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];

playmusic "Overdose";

titletext ["GROO FRAMEWORK\nFeatures:\nMonsada's UPSMON\nBangabob's EOS\nFHQ Task Tracker\n=BTC= Logistics\n=BTC= Revive\nZuff Group Management\nJamac Vehicle Service","PLAIN"];

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

titletext ["A Mission By\n The VMB S3 Team\nCpl.OfKings - Mission Editing\nCpl.Andrade - Scripting Sorcery","PLAIN"];

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

titletext ["OPERACAO SOCRATES Parte 2","PLAIN"];

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

titletext ["Special Thanks:\nLt.Godspeed\nCdt.Nascimento\nCpl.IronPack\nRc.Abreu\nFor support testing the mission.","PLAIN"];

;comment "21:20:33";
_camera camPrepareTarget [102176.81,-2204.58,1848.99];
_camera camPreparePos [2450.04,4980.68,15.95];
_camera camPrepareFOV 0.012;
_camera camCommitPrepared 7;
waitUntil {camCommitted _camera;};

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

titletext ["Prepare yourself...","PLAIN"];

sleep 10;

titletext ["IT'S TIME TO ROCK!","PLAIN"];

playmusic "Doom";

;comment "5:29:11";
_camera camPrepareTarget [-81510.02,-52376.75,-10399.63];
_camera camPreparePos [2650.07,613.21,1.88];
_camera camPrepareFOV 0.076;
_camera camCommitPrepared 0;

sleep 5;

;comment "5:31:53";
_camera camPrepareTarget [-20478.92,-87224.34,-41753.73];
_camera camPreparePos [2645.54,616.71,4.17];
_camera camPrepareFOV 1.498;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera;};

;comment "5:34:33";
_camera camPrepareTarget [-68235.05,-56203.77,-41757.99];
_camera camPreparePos [2639.17,605.54,4.08];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "5:35:09";
_camera camPrepareTarget [-68235.05,-56203.77,-41757.83];
_camera camPreparePos [2613.46,637.62,5.52];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

;comment "5:36:48";
_camera camPrepareTarget [70584.18,-70828.25,-15709.91];
_camera camPreparePos [2549.66,711.50,34.88];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

;comment "5:37:17";
_camera camPrepareTarget [66846.79,-66898.38,-36031.06];
_camera camPreparePos [2619.25,649.50,4.58];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
waitUntil {camCommitted _camera;};

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