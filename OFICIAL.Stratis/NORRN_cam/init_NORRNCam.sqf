// init_NORRNCam.sqf
// © OCTOBER 2011 - norrin
private ["_pos","_bee"];
titletext ["Initialising camera","BLACK", 5];
sleep 0.5;
[] spawn Nor_MCAM;
//Camera Options - hoz and mandoble's free cam settings, OFPEC - see: http://www.ofpec.com/forum/index.php?topic=32970.0
OFPEC_MouseCoord = [0.5,0.5];
OFPEC_MouseScroll = 0;
OFPEC_MouseButtons =[false,false];
OFPEC_camzoomspeed = 1.0;
OFPEC_maxzoomout = 600;
OFPEC_range_to_unit = 5;  //starting dist from target