@tool
@icon("res://wtyczki/Postacie/postać.svg")
class_name Postać extends CharacterBody2D

@export var szybkosc = 250
@export var silaSkoku = -1000
@export var tarcie = 2000
@export var przyspieszenie = 100
var silaGrawitacji = ProjectSettings.get_setting("physics/2d/default_gravity")

func grawitacja(delta, czyKojociCzasomierzNieMinął: bool):
	if !Engine.is_editor_hint():
		if !czyKojociCzasomierzNieMinął:
			velocity.y += silaGrawitacji * delta

func ruch(kier, delta):
	if kier != 0:
		velocity.x = move_toward(velocity.x, kier*szybkosc, delta * przyspieszenie)
	else:
		velocity.x = move_toward(velocity.x, 0, tarcie * delta)

func skok(czyKojociCzasomierzNieMinął: bool):
	if is_on_floor() or czyKojociCzasomierzNieMinął:
		velocity.y += silaSkoku
		return true
	return false
