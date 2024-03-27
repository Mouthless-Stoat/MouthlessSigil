Extends SigilEffect

func handle_event(event: String, params: Array):
    if event == "card_summoned" and params[0] == card and isFriendly:
        fightManager.draw_card(CardInfo.all_card[randi() % CardInf.all_card.size()])
