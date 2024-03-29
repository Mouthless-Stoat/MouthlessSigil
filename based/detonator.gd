extends SigilEffect

func handle_event(event: String, params: Array):
	if event == "card_perished" and params[0] == card:
		var dmg = card.card_data.detorDmg

		var slotIdx = card.slot_idx()
		
		print(("friendly" if isFriendly else "enemy"), " boombot perished in slot ", slotIdx)
		
		if isFriendly:
			# Attack the moon
			if fightManager.get_node("MoonFight/BothMoons/EnemyMoon").visible:
				fightManager.get_node("MoonFight/BothMoons/EnemyMoon").take_damage(5)

			elif not slotManager.is_slot_empty(slotManager.enemySlots[slotIdx]):
				var eCard = slotManager.get_enemy_card(slotIdx)
				eCard.take_damage(card, dmg)
				
			# Kill adjacents
			for offset in [-1, 1]:
				
				var eCard = slotManager.get_friendly_card(slotIdx + offset)
				
				if eCard:
					eCard.take_damage(card, dmg)
		else:
			# Attack the moon
			if fightManager.get_node("MoonFight/BothMoons/FriendlyMoon").visible:

				fightManager.get_node("MoonFight/BothMoons/FriendlyMoon").take_damage(5)
				
			elif not slotManager.is_slot_empty(slotManager.playerSlots[slotIdx]):
				var eCard = slotManager.get_friendly_card(slotIdx)
				eCard.take_damage(card, dmg)
				
			# Kill adjacents
			for offset in [-1, 1]:
				
				var eCard = slotManager.get_enemy_card(slotIdx + offset)
				
				if eCard:
					eCard.take_damage(card, dmg)
