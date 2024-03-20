extends Node2D

@onready var naciśnij_e = $"NaciśnijE"
@onready var label = $"NaciśnijE/Label"
@onready var oczy = $Oczy
var gdziePrzesunąć = 1
var czas: float = 0
var bohater

func _ready():
	naciśnij_e.visible = false
	oczy.visible = false

func _physics_process(delta):
	if czas >= 0.25:
		if gdziePrzesunąć == 1:
			naciśnij_e.position.y += 1
			gdziePrzesunąć-=1
		else:
			naciśnij_e.position.y += -1
			gdziePrzesunąć+=1
		czas = 0
	else:
		czas += delta

func _process(_delta):
	if Input.is_action_just_pressed("wybórE") and naciśnij_e.visible:
		bohater.visible = !bohater.visible
		oczy.visible = !bohater.visible
		bohater.position = Vector2(self.position.x+32, self.position.y+32)
		if bohater.visible:
			label.text = "WEJDŹ"
		else:
			label.text = "WYJDŹ"


func _on_area_2d_body_entered(body):
	if body.name == "boskiSędzia":
		bohater = body
		naciśnij_e.visible = true


func _on_area_2d_body_exited(body):
	if body.name == "boskiSędzia":
		naciśnij_e.visible = false
