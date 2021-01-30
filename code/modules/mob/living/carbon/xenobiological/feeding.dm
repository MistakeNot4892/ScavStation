/mob/living/slime/proc/set_nutrition(var/amt)
	nutrition = Clamp(amt, 0, initial(nutrition))

/mob/living/slime/proc/check_valid_feed_target(var/mob/living/M, var/check_already_feeding = TRUE)
	if(QDELETED(M) || !istype(M) || !isturf(M.loc))
		return FALSE
	if(M == src)
		to_chat(src, SPAN_WARNING("You cannot feed on yourself."))
		return FALSE
	if(check_already_feeding && feeding_on)
		to_chat(src, SPAN_WARNING("You are already feeding on \the [feeding_on]."))
		return FALSE
	if(!istype(M) || issilicon(M) || isslime(M))
		to_chat(src, SPAN_WARNING("You cannot feed on \the [M]."))
		return FALSE
	if(!Adjacent(M))
		to_chat(src, SPAN_WARNING("\The [M] is too far away."))
		return FALSE
	if(M.get_blocked_ratio(null, TOX, damage_flags = DAM_DISPERSED | DAM_BIO) >= 1)
		to_chat(src, SPAN_WARNING("\The [M] is protected from your feeding."))
		return FALSE
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.species_flags & (SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_SCAN))
			to_chat(src, SPAN_WARNING("You cannot feed on \the [M]."))
			return FALSE
	if(M.stat == DEAD)
		to_chat(src, SPAN_WARNING("\The [src] is dead."))
		return FALSE
	if(iscarbon(M) && M.getCloneLoss() >= M.maxHealth * 1.5)
		to_chat(src, SPAN_WARNING("\The [M] is too degraded to feed upon."))
		return FALSE
	for(var/mob/living/slime/met in view())
		if(met.feeding_on == M)
			to_chat(src, SPAN_WARNING("\The [met] is already feeding on \the [M]."))
			return FALSE
	return TRUE

/mob/living/slime/proc/set_feeding_on(var/mob/living/victim)
	if(feeding_on == victim)
		return
	if(feeding_on)
		GLOB.moved_event.unregister(feeding_on, src)
		GLOB.destroyed_event.unregister(feeding_on, src)
	feeding_on = victim
	if(feeding_on)
		GLOB.moved_event.register(feeding_on, src, /mob/living/slime/proc/check_feed_target_position)
		GLOB.destroyed_event.register(feeding_on, src, /mob/living/slime/proc/check_feed_target_position)
	var/datum/ai/slime/slime_ai = ai
	if(istype(slime_ai))
		slime_ai.update_mood()
	regenerate_icons()

/mob/living/slime/proc/slime_attach(var/mob/living/M)
	if(check_valid_feed_target(M))
		set_feeding_on(M)
		forceMove(get_turf(M))

/mob/living/slime/proc/check_feed_target_position()
	if(!QDELETED(feeding_on) && isturf(feeding_on.loc))
		if(loc == feeding_on.loc)
			return TRUE
		if(Adjacent(feeding_on))
			forceMove(get_turf(feeding_on))
			return TRUE
	set_feeding_on()
	return FALSE

/mob/living/slime/proc/slime_feed()

	if(!feeding_on || stat != CONSCIOUS)
		return FALSE

	if(!check_feed_target_position())
		return FALSE

	if(!check_valid_feed_target(feeding_on, check_already_feeding = FALSE))
		set_feeding_on()
		return FALSE

	var/drained = feeding_on.slime_feed_act()
	if(!drained)
		set_feeding_on()
		return FALSE

	gain_nutrition(drained)
	var/heal_amt = Floor(drained*0.5)
	if(heal_amt > 0)
		adjustOxyLoss(-heal_amt) //Heal yourself
		adjustBruteLoss(-heal_amt)
		adjustFireLoss(-heal_amt)
		adjustCloneLoss(-heal_amt)
	return TRUE
