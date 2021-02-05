/mob/living/slime/death(gibbed, deathmessage, show_dead_message)
	if(stat != DEAD && !gibbed && is_adult)
		var/decl/slime_colour/slime_data = decls_repository.get_decl(slime_type)
		var/mob/living/slime/baby = new slime_data.child_type(loc, slime_type)
		step_away(baby, src)
		is_adult = FALSE
		amount_grown = 0
		maxHealth = 150
		revive()
		number = random_id(/mob/living/slime, 1, 1000)
		var/datum/ai/slime/my_ai = ai
		if(istype(my_ai))
			my_ai.rabid = TRUE
		var/datum/ai/slime/baby_ai = baby.ai
		if(istype(baby_ai))
			baby_ai.rabid = TRUE
			if(istype(my_ai))
				baby_ai.observed_friends = my_ai.observed_friends?.Copy()
		update_icon()
	else
		. = ..(gibbed, deathmessage, show_dead_message)
