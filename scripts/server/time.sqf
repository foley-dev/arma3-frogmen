private _times = [
	[13, 00],
	[17, 45],
	[20, 00]
];
_timeOfDay = _times select Foley_param_timeOfDay;
_timeOfDay params ["_hour", "_minute"];

setDate [2035, 6, 13, _hour, _minute];
