extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_hit" and params[1] == card and isFriendly:
		var moxwalk = false
		for c in slotManager.all_enemy_cards():
			for sigil in c.card_data.sigilwalkSigils:
				if c.has_sigil(sigil):
					moxwalk = true
					break
			if moxwalk:
				break
		
		if not moxwalk: return
		
		# don't do any dmg to the opposing creature
		var victim = params[0]
		if "Perish" in victim.get_node("AnimationPlayer").current_animation:
			victim.get_node("AnimationPlayer").stop()
		
		victim.health = victim.health + card.attack
		victim.draw_stats()
		
		fightManager.inflict_damage(card.attack)
