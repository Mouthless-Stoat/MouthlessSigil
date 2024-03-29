extends SigilEffect

var cardPrefab = preload("res://packed/A2Card.tscn")
var buttonScript = load("user://scripts/%s_movingButton.gd" % CardInfo.ruleset) # expect the button dependency to be here

func handle_event(event: String, params: Array):
	if event == "card_summoned" and params[0] == card and isFriendly:
		# check if the ui is already made to reuse
		if notInit(): initUi()
		initScry()
		fightManager.get_node("scryScreen").visible = true

func notInit() -> bool:
	return not fightManager.has_node("scryScreen")
	
func initUi():

	# copy the panel instead of making myself
	var panel = fightManager.get_node("WaitingBlocker").duplicate()
	panel.visible = true
	panel.name = "scryScreen"
	
	# because copy kill all the useless stuff
	for child in panel.get_children():
		panel.remove_child(child)
		child.queue_free()
	
	# main ui box in the middle of the screen, mostly for bg
	var box = Panel.new()
	box.name = "mainBox"
	box.set_size(Vector2(500, 1000))
	box.set_anchors_and_margins_preset(Control.PRESET_CENTER,Control.PRESET_MODE_KEEP_SIZE)
	panel.add_child(box)
	
	# the v box thatg contain the text, list and done button
	var vbox = VBoxContainer.new()
	vbox.name = "vbox"
	vbox.set_size(Vector2(500, 1000))
	box.add_child(vbox)
	
	# text at the top
	var label = Label.new()
	label.text = "Scrying..."
	label.align = Label.ALIGN_CENTER
	label.valign = Label.VALIGN_CENTER
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	vbox.add_child(label)
	
	var cardScroll = ScrollContainer.new()
	cardScroll.name = "scroll"
	cardScroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cardScroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	
	var cardVbox = VBoxContainer.new()
	cardVbox.name = "cardVbox"
	cardVbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cardVbox.size_flags_vertical = Control.SIZE_EXPAND_FILL
	
	var button = Button.new()
	button.text = "Done"
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.connect("pressed", self, "close")

	vbox.add_child(cardScroll)
	cardScroll.add_child(cardVbox)
	vbox.add_child(button)
	
	fightManager.add_child(panel)

func close():
	var cardVbox = fightManager.get_node("scryScreen/mainBox/vbox/scroll/cardVbox")
	var topDeck = []
	var botDeck = []
	var reachBot = false
	for child in cardVbox.get_children():
		if child.name == "bottomDeck":
			reachBot = true
		
		if reachBot:
			botDeck.append(child.text)
		else:
			topDeck.append(child.text)
		
		cardVbox.remove_child(child)
		child.queue_free()
	
	fightManager.deck = topDeck + fightManager.deck + botDeck
	fightManager.get_node("scryScreen").visible = false

func initScry():
	var cardVbox = fightManager.get_node("scryScreen/mainBox/vbox/scroll/cardVbox")
	
	var cardDisplay = Button.new()
	cardDisplay.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cardDisplay.set_script(buttonScript)
	
	var scryCard = []
	
	for i in card.card_data.scryAmount:
		scryCard.append(fightManager.deck.pop_front())
		
	print(scryCard)
	
	for card in scryCard:
		var nDisplay = cardDisplay.duplicate(7)
		nDisplay.text = card
		cardVbox.add_child(nDisplay)
	
	var bottomDeck = Button.new()
	bottomDeck.name = "bottomDeck"
	bottomDeck.text = "BOTTOM OF DECK"
	bottomDeck.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bottomDeck.set_script(buttonScript)
	cardVbox.add_child(bottomDeck)
