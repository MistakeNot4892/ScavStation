/obj/item/clothing/gloves
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/gloves_yinglet.dmi')
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/ears
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/glasses
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/head
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/suit
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/mask
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/accessory/cloak
	bodytype_restricted = list(BODYTYPE_HUMANOID, BODYTYPE_YINGLET)

/obj/item/clothing/under/tradeship_plain
	name = "plain clothes"
	desc = "Some very boring clothes."
	icon = 'mods/valsalia/icons/plainclothes.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_restricted = list(BODYTYPE_HUMANOID)

/obj/item/clothing/suit/storage/toggle/redcoat
	name = "\improper Tradehouse redcoat"
	desc = "The signature uniform of Tradeshouse guardsmen."
	icon = 'mods/valsalia/icons/redcoat.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_restricted = list(BODYTYPE_HUMANOID)
	var/has_badge
	var/has_buttons
	var/has_collar
	var/has_buckle

/obj/item/clothing/suit/storage/toggle/redcoat/Initialize()
	update_icon()
	. = ..()

/obj/item/clothing/suit/storage/toggle/redcoat/examine(var/mob/user, var/distance)
	. = ..()
	if(has_badge)
		to_chat(user, "This one has a badge sewn to the front indicating the wearer is recognized by the Tradehouse.")

/obj/item/clothing/suit/storage/toggle/redcoat/proc/collect_overlays(var/use_state)
	var/list/adding_overlays
	var/state_modifier = open ? "_open" : ""
	if(has_badge)
		LAZYADD(adding_overlays, "[use_state]-[has_badge][state_modifier]")
	if(has_buttons)
		LAZYADD(adding_overlays, "[use_state]-[has_buttons][state_modifier]")
	if(has_collar)
		LAZYADD(adding_overlays, "[use_state]-[has_collar][state_modifier]")
	if(has_buckle)
		LAZYADD(adding_overlays, "[use_state]-[has_buckle][state_modifier]")
	. = adding_overlays

/obj/item/clothing/suit/storage/toggle/redcoat/on_update_icon()
	set_overlays(collect_overlays(get_world_inventory_state()))

/obj/item/clothing/suit/storage/toggle/redcoat/get_mob_overlay(var/mob/user_mob, var/slot)
	var/image/ret = ..()
	ret.overlays += collect_overlays(ret.icon_state)
	return ret

/obj/item/clothing/suit/storage/toggle/redcoat/service
	name = "\improper Tradehouse service coat"
	desc = "The brown-collared uniform of Tradehouse service staff."
	has_collar = "collar_brown"

/obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
	has_badge = "badge"

/obj/item/clothing/suit/storage/toggle/redcoat/officiated
	has_badge = "badge"

/obj/item/clothing/suit/storage/toggle/redcoat/officer
	name = "\improper Tradehouse officer's coat"
	desc = "The striking uniform of a Tradehouse guard officer, complete with gold collar and buttons."
	has_badge =   "badge"
	has_buttons = "buttons_gold"
	has_collar =  "collar_gold"
	has_buckle =  "buckle_gold"
