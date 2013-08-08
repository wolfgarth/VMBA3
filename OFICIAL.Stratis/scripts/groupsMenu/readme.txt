Zuff's Group Management Script 1.1

About
This script gives the player the ability to leave and join groups, as well as become or stop being Group Leader. Player gets an option from the scroll-menu to open "Groups Menu". In this menu you get contextual options depending on whether or not you're in a group or are group leader. These options are:

Leave Group = Leaves current group
Join Group = Joins Group of Unit you are looking at AND near. Distance can be changed in "scripts\groupsMenu\groupActions.sqf" here:

================================================================================

GRPMNU_joinGroup = _caller addAction["<t color='#EB7FAF'>Join Group</t>", "scripts\groupsMenu\joinGroup.sqf", nil, -998, false, false, "", "(cursorTarget distance _this) < 4 && (count units group _this) == 1 && side cursorTarget == side _this"];

================================================================================

You can change "4" to any number.

Become Group Lead = Become group leader of your current group
Step Down as Group Lead = Stop being group leader and randomly assign another group member as leader
Exit Groups Menu = Leaves this current menu

It's all done through addActions. It's fairly simple and was needing it for a mission I'm working on so I'd thought I'd release it separately for those who may need it.

Should be Multiplayer and JIP compatible, let me know if it isn't.

If you have any suggestions or problems, please post!

Installation
Copy the "scripts" folder into your mission folder.
Add this to your init.sqf:

================================================================================

[player] execVM "scripts\groupsMenu\initGroups.sqf";

================================================================================

And you're done! Try the sample mission if you'd like to quickly test the script.

Issues
The only issue is when after leaving a group, there is a brief delay before the addAction "Join Group" reappears. Not sure if this is something that I can fix or if it's just Arma related.

Changelog
4/30/13 - 1.0 Released
5/2/13 - 1.1 Released
    Fixed: Player no longer can use action on own dead body after respawn
    Fixed: Cleaner code for init.sqf (moved respawn code to initGroups.sqf)