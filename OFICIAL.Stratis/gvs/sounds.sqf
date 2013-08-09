Sound_Loop = 
{
	_sound = _this select 0;
	_duration = _this select 1;
	_position = _this select 2;
	
	_trigger = createTrigger["EmptyDetector" , _position];
	_trigger setTriggerStatements ["true" , "" , ""];
	_trigger setSoundEffect["NoSound" , "" , "" , _sound];
	
	while {_duration > 0} do
	{
		
		sleep 0.1;
		_duration = _duration - 0.1;
	};
};