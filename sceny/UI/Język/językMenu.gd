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
	_on_powróć_pressed()


func _on_powróć_pressed():
	get_tree().change_scene_to_file("res://sceny/UI/KartaGłówna.tscn")

