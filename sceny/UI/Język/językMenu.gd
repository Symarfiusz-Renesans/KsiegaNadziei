extends Control

@onready var plik = get_node("ColorRect/MarginContainer/KontenerGłówny/KontenerNaZmianę/Label")
var możliweJęzyki
var wybranyJęzyk = "Polski"

func _ready():
	możliweJęzyki = plik.get("języki")

func _on_potwierdź_pressed():
	var liczba = plik.get("liczba")
	wybranyJęzyk = możliweJęzyki[liczba]
	ZarzadzanieDanymi.nadpiszDane("wybranyJęzyk", wybranyJęzyk)
	match wybranyJęzyk:
		"Polski": 
			TranslationServer.set_locale("pl")
		"English": 
			TranslationServer.set_locale("en")
		"Deutsch": 
			TranslationServer.set_locale("de")
		"Magyarul": 
			TranslationServer.set_locale("hu")
		"Esperanta":
			TranslationServer.set_locale("eo")
	print(TranslationServer.get_locale)
	_on_powróć_pressed()


func _on_powróć_pressed():
	self.hide()

