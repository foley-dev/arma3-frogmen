# Frogmen

![Loading screen]()

*Flooding proof of concept*

## About

* Co-op
* Map: **Tanoa**
* Player count: **20**
* Typical duration: **40 min**
* [Mod dependencies]()

## Scripting highlights

* Scripted flood of a town area based on the `setTerrainHeight` command
    * **Packed into a function you can use in your mission `scripts\server\flood.sqf`**
    * Flood depth selectable in mission parameters `description.ext`
    * Loading screen in case the mission starts before flooding is complete `scripts\player\floodLoading.sqf`
* All street lamps switched off due to glitchy appearance after changing terrain height (as of Arma 3 v2.10) `scripts\common\lamps.sqf`

## Screenshots

![Screenshot]()
