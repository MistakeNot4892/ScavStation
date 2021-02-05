/mob/living/slime/on_update_icon()
	regenerate_icons()

/mob/living/slime/regenerate_icons()
	var/decl/slime_colour/slime_data = decls_repository.get_decl(slime_type)
	icon = (stat != DEAD && is_adult) ? slime_data.adult_icon : slime_data.baby_icon // dead adults have no icon
	icon_state = initial(icon_state)
	layer = initial(layer)
	if(stat == DEAD)
		icon_state = "[icon_state]_[cores ? "dead" : "nocore"]"
	else if(feeding_on)
		icon_state = "[icon_state]_eat"
		layer = ABOVE_HUMAN_LAYER
	cut_overlays()
	var/datum/ai/slime/slime_ai = ai
	if(stat != DEAD && istype(slime_ai) && slime_ai.mood)
		add_overlay(image(slime_data.mood_icon, "aslime-[slime_ai.mood]"))
