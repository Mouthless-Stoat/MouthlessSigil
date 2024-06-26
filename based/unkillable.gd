extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_perished" and params[0] == card and isFriendly:
		var old_data = card.card_data.duplicate()

		old_data.attack += old_data.unkillBuff
		old_data.health += old_data.unkillBuff

		# Draw the modified card copy
		fightManager.draw_card(old_data)
