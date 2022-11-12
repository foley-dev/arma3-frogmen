Foley_floodProgress = 0;
publicVariable "Foley_floodProgress";

Foley_fnc_floodTerrain = { 
	params ["_areaTrigger", "_maxDepth", "_span", ["_chunkSize", 100]];
	
	private _center = getPos _areaTrigger;

	if (isNil "_span") then {
		_span = ((triggerArea _areaTrigger) select 0) min ((triggerArea _areaTrigger) select 1);
	};

	private _terrainGrid = getTerrainInfo select 2;
	_chunkSize = round (_chunkSize / _terrainGrid) * _terrainGrid;
	_span = round (_span / _terrainGrid) * _terrainGrid;
	private _originX = (round ((_center select 0) / _terrainGrid) * _terrainGrid) - _span;
	private _originY = (round ((_center select 1) / _terrainGrid) * _terrainGrid) - _span;
	private _totalGrids = (1 + floor ((2 * _span) / _chunkSize)) ^ 2;
	private _coveredGrids = 0;
	diag_log str [_terrainGrid, _span, _originX, _originY, _totalGrids, _chunkSize];

	for "_xChunkStep" from 0 to 2 * _span step _chunkSize do {
		for "_yChunkStep" from 0 to 2 * _span step _chunkSize do {
			private _chunkName = str [floor (_xChunkStep / _chunkSize), floor (_yChunkStep / _chunkSize)];
			diag_log ("[Flood] Calculating geometry for chunk " + _chunkName + "...");
			private _gridGeometry = [];
			
			for "_xStep" from _xChunkStep to (_xChunkStep + _chunkSize - 1) min (2 * _span) step _terrainGrid do {
				for "_yStep" from _yChunkStep to (_yChunkStep + _chunkSize - 1) min (2 * _span) step _terrainGrid do {
					private _point = [_originX + _xStep, _originY + _yStep, 0];
					private _distance = _point distance2D _center;

					if (_distance > _span) then {
						continue;
					};

					_point set[2, (getTerrainHeight _point) - linearConversion [0, _span, _span - _distance, 0, _maxDepth, true]];
					_gridGeometry pushBack _point;
				};
			};

			_coveredGrids = _coveredGrids + 0.5;
			Foley_floodProgress = _coveredGrids / _totalGrids;
			publicVariable "Foley_floodProgress";

			diag_log ("[Flood] Applying geometry for chunk " + _chunkName + "...");
			setTerrainHeight [_gridGeometry, true];

			_coveredGrids = _coveredGrids + 0.5;
			Foley_floodProgress = _coveredGrids / _totalGrids;
			publicVariable "Foley_floodProgress";

			diag_log ("[Flood] Progress " + (str round (100 * Foley_floodProgress)) + "%");
		};
	};

	Foley_floodProgress = 1.0;
	publicVariable "Foley_floodProgress";
};

uisleep 3;
diag_log "[Flood] Starting...";

private _floodParams = [
	[floodArea, 14],
	[floodArea, 10, 700],
	[floodArea, 14, 1300],
	[floodArea, 20, 1300],
	[floodArea, 25, 1600],
	[altFloodArea, 40]
];
(_floodParams select Foley_param_flood) call Foley_fnc_floodTerrain;

diag_log "[Flood] Finished";
