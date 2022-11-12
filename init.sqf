call compile preprocessFileLineNumbers "scripts\common\params.sqf";
	
if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	call compile preprocessFileLineNumbers "scripts\player\briefing.sqf";
	execVM "scripts\player\missionTitle.sqf";
	execVM "scripts\player\floodLoading.sqf";

	player addRating 100000;
	doStop player;
};

if (isServer) then {
	call compile preprocessFileLineNumbers "scripts\server\time.sqf";
	call compile preprocessFileLineNumbers "scripts\server\flood.sqf";
};

call compile preprocessFileLineNumbers "scripts\common\lamps.sqf";
[TOUR_respawnTickets, TOUR_respawnTime] execVM "scripts\TOUR_RC\init.sqf";
