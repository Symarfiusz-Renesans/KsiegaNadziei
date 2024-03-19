extends Control

@onready var color_rect = $ColorRect
@onready var margin_container = $ColorRect/MarginContainer
@onready var zawartość = $ColorRect/MarginContainer

func _ready():
	TranslationServer.set_locale("pl")
	print(TranslationServer.get_locale())
	Gedzba.puśćGędźbę()

func _on_graj_pressed():
	zawartość.ustalDane("góra")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://sceny/senaPróbna.tscn")

#func _notification(what):
#	if what == NOTIFICATION_WM_CLOSE_REQUEST:
#		get_tree().set_auto_accept_quit(false)

func _on_opcje_pressed():
	zawartość.ustalDane("prawo")


func _on_twórcy_pressed():
	print("działa")


func _on_wyjdź_pressed():
	zawartość.ustalDane("dół")
	await get_tree().create_timer(3).timeout
	get_tree().quit() 


func _on_wróć_pressed():
	zawartość.ustalDane("lewo")


func _on_język_pressed():
	get_tree().change_scene_to_file("res://sceny/UI/Język/Język.tscn")


func _on_dźwięk_pressed():
	get_tree().change_scene_to_file("res://sceny/UI/Dźwięk/Dźwięk.tscn")


func _on_grafika_pressed():
	pass # Replace with function body.


func _on_sterowanie_pressed():
	pass # Replace with function body.


func _on_kontener_na_opcje_2_w_lewo():
	_on_wróć_pressed()
