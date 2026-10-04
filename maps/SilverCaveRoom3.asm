	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	faceplayer
	checkevent EVENT_MT_SILVER_RED_BEATEN
	iftrue .Mewtwo
	special FadeOutMusic
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_MT_SILVER_RED_BEATEN
.Mewtwo
	opentext
	writetext MtSilverMewtwoAppearsText
	waitbutton
	closetext
	cry MEWTWO
	loadwildmon MEWTWO, 70
	startbattle
	ifequal DRAW, .Fled
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInFromBlack
	pause 30
	special HealParty
	reanchormap
	credits
	end

.Fled
	reloadmapafterbattle
	end

RedSeenText:
	text "…"
	line "…"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "…"
	line "…"
	done
	
MtSilverMewtwoAppearsText:
	text "…A tremendous"
	line "presence fills"
	cont "the summit."
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
