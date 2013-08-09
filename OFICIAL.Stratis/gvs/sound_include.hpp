class CfgSounds
{
	sounds[]={};
	class NoSound 
	{
		name = "NoSound";
		sound[] = {"gvs\Dummy.ogg", 0, 1};
		titles[] = {};
	};

};
  // soundName[] = {"path to file", VOL, PITCH, probability of being played, min delay, average delay, maximum delay after the sound};
  //sound1[]={"sounds\Trans_SFX.ogg",0.1,1,0.5,0,0,0};
  //empty[] = {not used, not used, not used, not used, minimum pause, average pause, maximum pause};
  //empty[]={"","","","",0,0,0};
  
class CfgSFX {
	sounds[] = {Fueling, Repairing, Reloading};
	class Fueling {
		name = "Fueling";
		sounds[]=
		{
			Fuel
		};
		Fuel[]=
		{
			"Fuel.ogg",1,1,50,1,0,0,0};
			empty[]= {"",0,0,0,0,0,0,0};
		};
	class Repairing {
		name = "Repairing";
		sounds[]=
		{
			Repair
		};
		Repair[]=
		{
			"Repair.ogg", db-0, 1, 1, 1, 1, 1};
			empty[]= {, , , , 1, 5, 20};
		};
	class Reloading {
		name = "Reloading";
		sounds[]=
		{
			Reload
		};
		Reload[]=
		{
			"Reload.ogg",1,1,50,1,0,0,0};
			empty[]= {"",0,0,0,0,0,0,0};
		};
};