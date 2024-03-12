extends Control

var GłośnośćGłówna = float(ZarzadzanieDanymi.znajdźDane("głośnośćGłówna"))
var GłośnośćGędźby = float(ZarzadzanieDanymi.znajdźDane("głośnośćGędźby"))
var GłośnośćEfektów = float(ZarzadzanieDanymi.znajdźDane("głośnośćEfektów"))
@onready var suwakGGł = get_node("ColorRect/MarginContainer/KontenerGłówny/KontenerNaSuwakGGłównej/suwakGGłówna")
@onready var suwakGG = get_node("ColorRect/MarginContainer/KontenerGłówny/KontenerNaSuwakGGędźby/suwakGGędźby")
@onready var suwakGE = get_node("ColorRect/MarginContainer/KontenerGłówny/KontenerNaSuwakGDźwięków/suwakGDźwięków")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	suwakGGł.value = GłośnośćGłówna
	suwakGG.value = GłośnośćGędźby
	suwakGE.value = GłośnośćEfektów
	_on_suwak_gdźwięków_value_changed(GłośnośćEfektów)
	_on_suwak_ggłówna_value_changed(GłośnośćGłówna)
	_on_suwak_ggędźby_value_changed(GłośnośćGędźby)


func _on_powróć_pressed():
	self.hide()

func _on_suwak_gdźwięków_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Efekty"), linear_to_db(value))
	ZarzadzanieDanymi.nadpiszDane("głośnośćEfektów", str(value).pad_decimals(2))

func _on_suwak_ggłówna_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	ZarzadzanieDanymi.nadpiszDane("głośnośćGłówna", str(value).pad_decimals(2))

func _on_suwak_ggędźby_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Gędźba"), linear_to_db(value))
	ZarzadzanieDanymi.nadpiszDane("głośnośćGędźby", str(value).pad_decimals(2))
