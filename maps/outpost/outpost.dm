#if !defined(USING_MAP_DATUM)

	#include "..\..\mods\valsalia\_valsalia.dme"

	#include "outpost_areas.dm"
	#include "outpost_shuttles.dm"
	#include "outpost_unit_testing.dm"

	#include "outpost-1.dmm"
	#include "outpost-2.dmm"
	#include "outpost-3.dmm"

	#define USING_MAP_DATUM /datum/map/outpost

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Outpost

#endif
