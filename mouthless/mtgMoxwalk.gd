extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_hit" and params[1] == card and isFriendly:
		var notMoxWalk = true
		for c in slotManager.all_enemy_cards():
			if c.has_sigil("Green Mox") or c.has_sigil("Blue Mox") or c.has_sigil("Orange Mox"):
				notMoxWalk = false
				break
		
		if notMoxWalk: return
		
		# don't do any dmg to the opposing creature
		var victim = params[0]
		if "Perish" in victim.get_node("AnimationPlayer").current_animation:
			victim.get_node("AnimationPlayer").stop()
		
		victim.health = victim.health + card.attack
		victim.draw_stats()
		
		fightManager.inflict_damage(card.attack)
