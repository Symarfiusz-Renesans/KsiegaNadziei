extends MarginContainer
var język
var ustawienia

func _ready():
	ustawienia = $NaUstawienia
	język = $"Język"
	język.hide()
	
func _on_język_pressed():
	język.show()
	ustawienia.hide()

func _on_dźwięk_pressed():
	get_tree().change_scene_to_file("res://sceny/UI/Dźwięk/Dźwięk.tscn")

func _on_grafika_pressed():
	pass # Replace with function body.

func _on_sterowanie_pressed():
	pass # Replace with function body.

func _on_wróć_pressed():
	self.visible = false
