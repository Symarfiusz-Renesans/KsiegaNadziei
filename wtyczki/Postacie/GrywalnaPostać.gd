@tool
class_name GrywalnaPostać extends Postać

@onready var sprite_2d = $Sprite2D
@onready var kojociCzasomierz = $KojociCzasomierz
@onready var pauza = $Pauza
@onready var wyświetlacz_o_postaci = $"WyświetlaczOPostaci"

var czyByłNaZiemi = false
var czyJeszczeNieSkoczył = true

func _process(_delta):
	if pauza.is_visible_in_tree():
		wyświetlacz_o_postaci.visible = false
	else:
		wyświetlacz_o_postaci.visible = true

func kontrolaRuchu(delta):
	var kier = 0
	if Input.is_action_pressed("wPrawo"):
		kier = 1
	if Input.is_action_pressed("wLewo"):
		kier = -1
	if Input.is_action_just_pressed("bieg"):
		szybkosc *= 2
	if Input.is_action_just_released("bieg"):
		szybkosc /= 2
	if Input.is_action_just_pressed("skok"):
		if skok(!kojociCzasomierz.is_stopped()):
			kojociCzasomierz.stop()
			czyJeszczeNieSkoczył = false
	else:
		czyJeszczeNieSkoczył = true
	ruch(kier, delta)
	żyworys(kier)
	czyByłNaZiemi = is_on_floor()
	move_and_slide()
	if not is_on_floor() and czyByłNaZiemi and czyJeszczeNieSkoczył:
		kojociCzasomierz.start()
	grawitacja(delta, !kojociCzasomierz.is_stopped())

func żyworys(kier):
	if (kier != 0):
		sprite_2d.flip_h = (kier < 0)

func włączeniePlecaka():
	pass
