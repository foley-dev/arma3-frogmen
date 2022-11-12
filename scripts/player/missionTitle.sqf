waitUntil {
	sleep 1;

	player inArea floodArea
};

private _text = "<t font='PuristaBold' size='1.6'>20 [Tour] Frogmen</t><br />by Foley";
[parseText _text, true, nil, 6, 0.6, 0] spawn BIS_fnc_textTiles;
