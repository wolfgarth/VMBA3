// null = [this] execVM "MILSIM\defaultloadout.sqf"; this addeventhandler ["respawn","_this execVM 'MILSIM\defaultloadout.sqf'"];

waitUntil {!isNull player};

_unit = _this select 0;

removeAllItems _unit;
removeVest _unit;
removeUniform _unit; 
removeAllWeapons _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeAllAssignedItems _unit;
removeallcontainers _unit;

_uniforms = ["U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite"];

_rnd = floor random (count _uniforms);

_uniform = _uniforms select _rnd;

_unit addUniform _uniform;

if(true) exitWith{};