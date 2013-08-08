/* =============================================
	!R
	Hide area markers.
	
	create Game Logic Object
	put in initialization field:
	
		nul = call compile preprocessFile "scripts\UPSMON\!R\markerAlpha.sqf";

	all markers area must be named area0, area1...area13
		
================================================= */

{ _x setmarkeralpha 0; } foreach [

			"mkrURBAN1",
			"mkrURBAN2",
			"mkrURBAN4",
			"mkrURBAN5",
			"mkrURBAN6",
			"mkrURBAN7",
			"mkrURBAN8",
			"mkrURBAN9",
			"mkrURBAN10",
			"mkrURBAN11",
			"mkrURBAN12",
			"mkrURBAN13",
			"mkrURBAN14",
			"mkrURBAN15",
			"mkrURBAN16",
			"mkrURBAN17",
			"mkrURBAN18",
			"mkrURBAN19",
			"mkrURBAN20",
			"mkrURBAN21",
			"mkrURBAN22",
			"mkrURBAN23",
			"mkrURBAN24",
			"mkrURBAN25",
			"mkrURBAN26",
			"mkrURBAN27",
			"mkrURBAN28",
			"mkrURBAN29",
			"mkrURBAN30",
			"mkrURBAN31",
			"mkrURBAN32",

			"mkrRoadblock1",
			"mkrRoadblock2",
			"mkrRoadblock3",
			"mkrRoadblock4",
			"mkrRoadblock5",
			"mkrRoadblock6",
			"mkrRoadblock7",
			"mkrRoadblock8",
			"mkrRoadblock9",
			"mkrRoadblock10",
			"mkrRoadblock11",
			"mkrRoadblock12",
			"mkrRoadblock13",
			"mkrRoadblock14",
			"mkrRoadblock15",
			"mkrRoadblock16",
			"mkrRoadblock17",
			"mkrRoadblock18",
			"mkrRoadblock19",

			"mkrTankPatrol1",
			"mkrTankPatrol2",
			"mkrTankPatrol3",
			"mkrTankPatrol4",
			"mkrTankPatrol7",



			"mkrHillPatrol1",
			"mkrHillPatrol2",
			"mkrHillPatrol3",
			"mkrHillPatrol4",
			"mkrHillPatrol7",
			"mkrHillPatrol8",
			"mkrHillPatrol9",
			"mkrHillPatrol10",
			"mkrHillPatrol11",
			"mkrHillPatrol12",
			"mkrHillPatrol13",

			"mkrSPECOPS1",
			"mkrSPECOPS2",
			"mkrSPECOPS3",
			"mkrSPECOPS4",
			"mkrSPECOPS5"

]; 