extends MarginContainer
@onready var język  = $"Język"
@onready var ustawienia = $NaUstawienia
@onready var dźwięk = $"Dźwięk"

signal wLewo 

var czyWKarcieGłównej: bool = false

func _ready():
	język.hide()
	dźwięk.hide()
	
func _process(delta):
	if język.visible == false and dźwięk.visible == false:
		ustawienia.show()
	
func _on_język_pressed():
	ustawienia.hide()
	język.show()

func _on_dźwięk_pressed():
	ustawienia.hide()
	dźwięk.show()

func _on_grafika_pressed():
	pass # Replace with function body.

func _on_sterowanie_pressed():
	pass # Replace with function body.

func _on_wróć_pressed():
	if czyWKarcieGłównej:
		wLewo.emit()
	else:
		self.visible = false


func _on_opcje_pressed():
	czyWKarcieGłównej = true
