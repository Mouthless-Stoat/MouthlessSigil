extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_summoned" and params[0] == card:
		card.get_node("AnimationPlayer").play("Perish")
