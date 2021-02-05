/mob/living/slime/Life()
	. = ..()
	if(. && stat != DEAD)
		handle_local_conditions()
		handle_nutrition()
		if(feeding_on)
			slime_feed()
		ingested.metabolize()

/mob/living/slime/updatehealth()
	. = ..()
	if(stat != DEAD && health <= 0)
		death()

/mob/living/slime/fluid_act(datum/reagents/fluids)
	. = ..()
	if(stat == DEAD)
		var/obj/effect/fluid/F = locate() in loc
		if(F && F.reagents?.total_volume >= FLUID_SHALLOW)
			F.reagents.add_reagent(/decl/material/liquid/slimejelly, (is_adult ? rand(30, 40) : rand(10, 30)))
			qdel(src)
	
/mob/living/slime/proc/handle_local_conditions()
	var/datum/gas_mixture/environment = loc?.return_air()
	adjust_body_temperature(bodytemperature, (environment?.temperature || T0C), 1)
	if(bodytemperature <= die_temperature)
		adjustToxLoss(200)
		death()
	else if(bodytemperature <= hurt_temperature)
		adjustToxLoss(30)
		updatehealth()

/mob/living/slime/proc/adjust_body_temperature(current, loc_temp, boost)
	var/delta = abs(current-loc_temp)
	var/change = (delta / (delta > 50 ? 5 : 10)) * boost
	if(current > loc_temp)
		change = -(change)
	bodytemperature += (min(loc_temp, current + change) - current)

/mob/living/slime/setHalLoss(amount)
	return

/mob/living/slime/adjustHalLoss(amount)
	return

/mob/living/slime/getHalLoss()
	return 0

/mob/living/slime/handle_regular_status_updates()
	. = ..()
	if(stat != DEAD)
		if(confused)
			confused--
		set_stat(CONSCIOUS)
		if(prob(30))
			adjustOxyLoss(-1)
			adjustToxLoss(-1)
			adjustFireLoss(-1)
			adjustCloneLoss(-1)
			adjustBruteLoss(-1)

/mob/living/slime/proc/handle_nutrition()
	adjust_nutrition(-(0.1 + 0.05 * is_adult))
	if(nutrition <= 0)
		adjustToxLoss(2)
		if (client && prob(5))
			to_chat(src, SPAN_DANGER("You are starving!"))
	else if(nutrition >= get_grow_nutrition() && amount_grown < SLIME_EVOLUTION_THRESHOLD)
		adjust_nutrition(-20)
		amount_grown++

/mob/living/slime/proc/get_max_nutrition() // Can't go above it
	. = is_adult ? 1200 : 1000

/mob/living/slime/proc/get_grow_nutrition() // Above it we grow, below it we can eat
	. = is_adult ? 1000 : 800

/mob/living/slime/proc/get_hunger_nutrition() // Below it we will always eat
	. = is_adult ? 600 : 500

/mob/living/slime/proc/get_starve_nutrition() // Below it we will eat before everything else
	. = is_adult ? 300 : 200

/mob/living/slime/slip() //Can't slip something without legs.
	return FALSE
