extends SigilEffect

var buttonScript = load("user://scripts/%s_button.gd" % CardInfo.ruleset) # expect the button dependency to be here

func handle_event(event: String, params: Array):
	if event == "card_summoned" and params[0] == card and isFriendly:
		# check if the ui is already made to reuse
		if notInit(): initUi()
		initSpell()
		fightManager.get_node("spellbookScreen").visible = true

func notInit() -> bool:
	return not fightManager.has_node("spellbookScreen")
	
func initUi():
	# copy the panel instead of making myself
	var panel = fightManager.get_node("WaitingBlocker").duplicate()
	panel.visible = true
	panel.name = "spellbookScreen"
	
	# because copy kill all the useless stuff
	for child in panel.get_children():
		panel.remove_child(child)
		child.queue_free()
	
	# main ui box in the middle of the screen, mostly for bg
	var box = Panel.new()
	box.name = "mainBox"
	box.set_size(Vector2(500, 800))
	box.set_anchors_and_margins_preset(Control.PRESET_CENTER,Control.PRESET_MODE_KEEP_SIZE)
	panel.add_child(box)
	
	# the v box thatg contain the text, list and done button
	var vbox = VBoxContainer.new()
	vbox.name = "vbox"
	vbox.set_size(Vector2(500, 800))
	box.add_child(vbox)
	
	# text at the top
	var label = Label.new()
	label.text = "Spellbook"
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

	vbox.add_child(cardScroll)
	cardScroll.add_child(cardVbox)
	
	fightManager.add_child(panel)

func select(button):
	fightManager.get_node("spellbookScreen").visible = false
	print(button.text)
	fightManager.draw_card(button.text)
	
	var cardVbox = fightManager.get_node("spellbookScreen/mainBox/vbox/scroll/cardVbox")
	
	for card in cardVbox.get_children():
		cardVbox.remove_child(card)
		card.queue_free()
	

func initSpell():
	var cardVbox = fightManager.get_node("spellbookScreen/mainBox/vbox/scroll/cardVbox")
	
	var cardDisplay = Button.new()
	cardDisplay.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cardDisplay.set_script(buttonScript)

	for c in card.card_data.spellbook_card:
		var nDisplay = cardDisplay.duplicate(7)
		nDisplay.text = c
		cardVbox.add_child(nDisplay)
		nDisplay.connect("attach", self, "select")
