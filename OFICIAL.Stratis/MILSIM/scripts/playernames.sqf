Waituntil{!isNull player};

while{true} do {
	sleep 0.5;
	if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < 5)) then {
		_tag = name cursorTarget;
		cutText [_tag,"PLAIN",0.1];
		
		//_ctrl ctrlSetStructuredText parsetext _tag;
		//_control ctrlSetStructuredText parseText format["<t>%1</t>",name cursorTarget];
		//_control ctrlSetText format["Gracz: %1",name cursorTarget];// for Displays
	} else {
		//_ctrl ctrlSetStructuredText parsetext "";
		//_control ctrlSetText "";// for Displays
	};
};
