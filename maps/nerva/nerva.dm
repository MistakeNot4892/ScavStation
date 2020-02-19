#if !defined(USING_MAP_DATUM)

	#include "nerva_announcements.dm"
	#include "nerva_areas.dm"
	#include "nerva_elevators.dm"
	#include "nerva_holodecks.dm"
	#include "nerva_presets.dm"
	#include "nerva_overmap.dm"
	#include "nerva_shuttles.dm"
	#include "nerva_unit_testing.dm"
	#include "datums/nerva_jobs.dm"
	#include "datums/nerva_access_datums.dm"
	#include "datums/nerva_outfits.dm"
	#include "obj/nerva_ids.dm"
	#include "obj/nerva_closets.dm"
	#include "obj/nerva_machinery.dm"

	#include "nerva-1.dmm"
	#include "nerva-2.dmm"
	#include "nerva-3.dmm"
	#include "nerva-4.dmm"
	#include "nerva-5.dmm"
	#include "nerva-6.dmm"

	#include "../away/mining/mining.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/icarus/icarus.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/unishi/unishi.dm"

	#include "../../code/datums/music_tracks/chasing_time.dm"
	#include "../../code/datums/music_tracks/absconditus.dm"
	#include "../../code/datums/music_tracks/clouds_of_fire.dm"
	#include "../../code/datums/music_tracks/endless_space.dm"
	#include "../../code/datums/music_tracks/dilbert.dm"
	#include "../../code/datums/music_tracks/space_oddity.dm"

	#define USING_MAP_DATUM /datum/map/nerva

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Nerva

#endif
