params ["_device"];

_pos = getPos _device;
_temp = createVehicle ["Land_Device_disassembled_F", _pos, [], 0, "CAN_COLLIDE"];
_temp attachTo [_device];

deleteVehicle _device;

sleep 5;
_part1 = nearestObjects [_temp, ["Land_DataTerminal_01_F"], 20] select 0;
_part2 = nearestObjects [_temp, ["Land_PortableGenerator_01_f"], 20] select 0;
deleteVehicle _part2;
[_part1, 2] call BIS_fnc_DataTerminalAnimate;
sleep 4;
_part3 = nearestObjects [_temp, ["Land_TripodScreen_01_dual_v1_F"], 20] select 0;
deleteVehicle _part3;
[_part1, 1] call BIS_fnc_DataTerminalAnimate;
sleep 4;
_part4 = nearestObjects [_temp, ["Land_TTowerSmall_1_F"], 20] select 0;
deleteVehicle _part4;
[_part1, 0] call BIS_fnc_DataTerminalAnimate;
sleep 3;
_part1 = nearestObjects [_temp, ["Land_DataTerminal_01_F"], 20] select 0;
deleteVehicle _part1;
sleep 3;

_pos = getPos _temp;
_cargo = createVehicle ["KG_Radio_slingloadable_F", _pos, [], 0, "CAN_COLLIDE"];
_cargo attachTo [_temp];
_cargo setDir 180;

deleteVehicle _temp;
