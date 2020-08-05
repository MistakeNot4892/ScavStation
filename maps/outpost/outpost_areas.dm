/world
	area = /area/wasteland
	turf = /turf/simulated/floor/exoplanet/desert

/area/wasteland
	name = "\improper Wasteland"
	icon_state = "storage"
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')
	always_unpowered = TRUE
	area_flags = AREA_FLAG_IS_BACKGROUND | AREA_FLAG_EXTERNAL
	dynamic_lighting = FALSE

/area/wasteland/flophouse
	name = "\improper Flophouse"
	icon_state = "fsmaint"
	ambience = null
	area_flags = AREA_FLAG_IS_BACKGROUND

/area/wasteland/rooftops
	name = "\improper Rooftops"
	icon_state = "surgery"

/area/wasteland/underground
	name = "\improper Underground"
	icon_state = "surgery"
	area_flags = AREA_FLAG_IS_BACKGROUND
	dynamic_lighting = TRUE
