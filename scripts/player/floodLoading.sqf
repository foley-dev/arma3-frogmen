waitUntil {
	time > 0 && !isNil "Foley_floodProgress"
};

sleep 0.01;

["floodProgress", "Loading..."] call BIS_fnc_startLoadingScreen;

while {Foley_floodProgress < 1.0} do {
	progressLoadingScreen Foley_floodProgress;
	uisleep 0.1;
};

"floodProgress" call BIS_fnc_endLoadingScreen;
