extends Control

@onready var kontener_na_pauzę = $"kontenerNaPauzę"
@onready var kontener_na_opcje = $kontenerNaOpcje


func _process(_delta):
	if Input.is_action_just_pressed("pauza"):
		self.visible = !self.visible
	if kontener_na_opcje.visible == false and self.visible == true:
		kontener_na_pauzę.visible = true
	if self.visible:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

func _ready():
	kontener_na_opcje.visible = false
	self.visible = false


func _on_wróć_pressed():
	self.visible = !self.visible

func _on_ustawienia_pressed():
	kontener_na_opcje.visible = true
	kontener_na_pauzę.visible = false
	
func _on_wyjdź_pressed():
	get_tree().quit() 
