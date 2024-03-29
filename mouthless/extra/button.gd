extends Button

signal attach(button)

func _pressed():
	emit_signal("attach", self)

