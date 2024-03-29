extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_hit" and params[1] == card and isFriendly:
		fightManager.inflict_damage(card.card_data.attack)
