params ["_device"];

_pos = getPos _device;
_repeater = createVehicle ["KG_Radio_disassembled_F", _pos, [], 0, "CAN_COLLIDE"];
_repeater attachTo [_device];
_repeater setDir 180;

deleteVehicle _device;

sleep 1;
_part1 = createVehicle ["Land_DataTerminal_01_F", _pos, [], 0, "None"];
_part1 attachTo [_repeater, [0, -2.5, -0.5]];
_part1 setDir 0;
_part1 enableSimulation false;
sleep 4;
_part2 = createVehicle ["Land_PortableGenerator_01_f", _pos, [], 0, "None"];
_part2 attachTo [_repeater, [1.5, -0.5, -0.09]];
_part2 setDir 300;
_part2 enableSimulation false;
[_part1, 1] call BIS_fnc_DataTerminalAnimate;
sleep 4;
_part3 = createVehicle ["Land_TripodScreen_01_dual_v1_F", _pos, [], 0, "None"];
_part3 attachTo [_repeater, [-1.05, 1.25, 0.26]];
_part3 setDir 240;
_part3 enableSimulation false;
[_part1, 2] call BIS_fnc_DataTerminalAnimate;
sleep 4;
_part4 = createVehicle ["Land_TTowerSmall_1_F", _pos, [], 0, "None"];
_part4 attachTo [_repeater, [1.25, 2.25, 0.94]];
_part4 setDir 200;
_part4 enableSimulation false;
[_part1, 3] call BIS_fnc_DataTerminalAnimate;

[{
    private _object = getPos player nearestObject "KG_Radio_disassembled_F";
	_distance = _object distance player;
    if (_distance < 5000) then {
		_factor = 2 - (_distance/5000);
		player setVariable ['tf_sendingDistanceMultiplicator', _factor, true];
		player setVariable ['tf_receivingDistanceMultiplicator', _factor, true];
		}
		else {
			player setVariable ['tf_sendingDistanceMultiplicator', 1, true];
			player setVariable ['tf_receivingDistanceMultiplicator', 1, true];
		};
		if (isNull _object) exitWith {(_this select 1) call CBA_fnc_removePerFrameHandler;
		};
}, 30] call CBA_fnc_addPerframeHandler;
