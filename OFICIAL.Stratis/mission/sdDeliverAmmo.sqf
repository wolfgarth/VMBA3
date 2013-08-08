// Side mission for collect AmmoBoxes
// By Groo

_debug = true;

private ["_mkrName","_posArray","_deliverPos","_i","_newSpawnpos","_marker","_marker1","_markerEOS","_triggerDelivery","_boxArray","_qths","_boxLeftArray","_pos","_newMarker","_posArrayLeft"];

_mkrName = "mkrDeliverAmmo";
_posArray = [
			/*Air Station Mike*/
			[6450.63,5377.44,0.00143814], // Kamino
			[4988.14,5920.65,0.00141907], // CampRogain
                        [3221.11,5807.31,0.00144196], // AgiaMarina
                        [4339.72,3815.11,0.00144958], // AirStation
                        [3280.38,2935.96,0.00143433], // CampMaxel
                        [2016.32,2721.15,0.00143647], // Girna
                        [1966.55,3524.45,0.00143528] //CampTempest					
			];
_deliverPos = [1877.06,5710.68,0.00143862];

_boxArray = [tskAmmobox1,tskAmmobox2,tskAmmobox3,tskAmmoBox4,tskAmmobox5,tskAmmobox6,tskAmmobox7];

_i = floor(random (count _posArray));
_newSpawnpos = _posArray select _i;

_marker = createMarker [_mkrName, _deliverPos];
_marker setmarkertype "hd_dot";
_marker setmarkertext "Ammo Box Delivery";
_marker setmarkercolor "colorBlack";


_markerEOS = [];
_qths = 0;
_posArrayLeft = _posArray;
{
	_pos = _posArrayLeft call BIS_fnc_selectRandom;
	_posArrayLeft = _posArrayLeft-[_pos];
	_x setpos _pos;
	
	if _debug then {["{hint format[""Moving box %1 to %2"",_qths,str(_pos)];}","BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;};
	hint format["Moving box %1 to %2",_qths,str(_pos)];
	sleep 5;
	
	_newMarker = createMarker [_mkrName+"EOS"+str(_qths), _pos];
	_newMarker setmarkersize [100,100];
	_newMarker setMarkerShape "ELLIPSE";
	_newMarker setMarkerBrush "DiagGrid";
	_newMarker setmarkercolor "colorRED";
	//_mkrName+"EOS"+str(_qths) setMarkerAlpha 0; 
	//Create enemy Resistance
	nul=[_mkrName+"EOS"+str(_qths),800,"Garrison","patrol"] execVM "scripts\GrooEOS.sqf";
	_markerEOS = _markerEOS + [_newMarker]; 
	_qths = _qths + 1;
	sleep 0.5;	


	
 }foreach _boxArray;
 
// Create Mission Task
[west,
["taskDeliverAmmo", "Find all Ammo Boxes load it into vehicles or bring to our Base. Destroy it if you need, but don't leave nothing in the hands of the enemy.",
"Recover Ammo", "", _deliverPos]
] call FHQ_TT_addTasks;

_boxes = count(_boxArray);
_boxLeftArray = _boxArray;
While {(count _boxLeftArray) > 0} do {

	{
		if (((position _x) distance _deliverPos) < 10) then {
										_boxes = _boxes - 1;
										_boxLeftArray = _boxLeftArray - [_x];
										["{hint format[""%1 Boxes Left"",_boxes;}","BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
										hint Format["%1 Boxes Left",_boxes];
										sleep 5;
										};
		if !(Alive _x) then {
										_boxes = _boxes - 1;
										_boxLeftArray = _boxLeftArray - [_x];
										sleep 5;
								};
	
	} forEach _boxLeftArray;
	sleep 10;
};
	
["taskDeliverAmmo","succeeded"] call FHQ_TT_setTaskState;

_qths = count _boxArray;
while {_qths > 0} do {
deletemarker _mkrName+"EOS"+str(_qths);
_qths = _qths - 1;
};

deletemarker _mkrName;





