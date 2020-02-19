/*
 * Neeeeeeeeeeerrrrrrrrrrrrrvvvvvvvvvvvvvvvaaaaaaaaaaaaaaa
 */

/obj/structure/closet/secure_closet/nervacap
	name = "captains's locker"
	req_access = list(access_captain)
	icon_state = "capsecure1"

/obj/structure/closet/secure_closet/nervacap/WillContain()
	return list(
		/obj/item/clothing/head/helmet,
		/obj/item/tank/jetpack/oxygen,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/gun/energy/gun/secure,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/melee/telebaton,
		/obj/item/flash,
		/obj/item/megaphone,
		/obj/item/storage/box/ids,
		/obj/item/material/clipboard,
		/obj/item/holowarrant,
		/obj/item/folder/blue
	)

/obj/structure/closet/secure_closet/nervafo
	name = "first officer's locker"
	req_access = list(access_fo)
	icon_state = "twosolsecure1"

/obj/structure/closet/secure_closet/nervafo/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/gun/energy/gun/small/secure,
		/obj/item/melee/telebaton,
		/obj/item/flash,
		/obj/item/megaphone,
		/obj/item/storage/box/headset,
		/obj/item/radio/headset/heads/captain,
		/obj/item/storage/box/large/ids,
		/obj/item/storage/box/PDAs,
		/obj/item/material/clipboard,
		/obj/item/holowarrant,
		/obj/item/folder/blue,
		/obj/item/storage/box/imprinting
	)

/obj/structure/closet/secure_closet/nervaso
	name = "second officer's locker"
	req_access = list(access_hop)
	icon_state = "hopsecure1"

/obj/structure/closet/secure_closet/nervaso/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/suit/armor/pcarrier/light,
		/obj/item/clothing/head/helmet,
		/obj/item/flash,
		/obj/item/storage/box/large/ids,
		/obj/item/storage/box/PDAs,
		/obj/item/material/clipboard,
		/obj/item/gun/energy/gun/small/secure,
	)

/obj/structure/closet/secure_closet/nervasec
	name = "security officer's locker"
	req_access = list(access_brig)
	icon_state = "sec1"

/obj/structure/closet/secure_closet/nervasec/WillContain()
	return list(
		/obj/item/storage/belt/holster/security,
		/obj/item/flash,
		/obj/item/chems/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/taperoll/police,
		/obj/item/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/gun/secure,
		/obj/item/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/holowarrant,
		/obj/item/flashlight/maglight
	)


/obj/structure/closet/secure_closet/nervacos
	name = "chief of security's locker"
	req_access = list(access_hos)
	icon_state = "hossecure1"

/obj/structure/closet/secure_closet/nervacos/WillContain()
	return list(
		/obj/item/clothing/head/HoS/dermal,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/taperoll/police,
		/obj/item/handcuffs,
		/obj/item/storage/belt/holster/security,
		/obj/item/flash,
		/obj/item/megaphone,
		/obj/item/melee/baton/loaded,
		/obj/item/gun/energy/gun/secure,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/melee/telebaton,
		/obj/item/chems/spray/pepper,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/hailer,
		/obj/item/material/clipboard,
		/obj/item/folder/red,
		/obj/item/holowarrant,
		/obj/item/clothing/gloves/thick,
		/obj/item/flashlight/maglight,
		/obj/item/taperecorder,
		/obj/item/hand_labeler
	)

/obj/structure/closet/secure_closet/science_nerva
	name = "Nanotrasen scientist's locker"
	req_access = list(access_xenoarch)
	icon_state = "secureres1"

/obj/structure/closet/secure_closet/science_nerva/WillContain()
	return list(
		/obj/item/clothing/under/rank/scientist,
		/obj/item/clothing/suit/storage/toggle/labcoat/science,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/mask/gas,
		/obj/item/material/clipboard,
		/obj/item/folder,
		/obj/item/taperecorder,
		/obj/item/tape/random = 3,
		/obj/item/camera,
		/obj/item/integrated_electronics/analyzer,
		/obj/item/taperoll/research,
		/obj/item/clothing/gloves/latex,
		/obj/item/clothing/glasses/science,
		/obj/item/clothing/glasses/meson,
		/obj/item/radio,
		/obj/item/flashlight/lantern
		)

/obj/structure/closet/secure_closet/nervaammo
	name = "ammunition locker"
	req_access = list(access_hos)
	icon_state = "hossecure1"
