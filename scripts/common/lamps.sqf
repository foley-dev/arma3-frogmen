private _lamps = nearestObjects [
	floodArea,
	["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"],
	1000
];

{
	[_x, false] call BIS_fnc_switchLamp; 
} forEach _lamps;
