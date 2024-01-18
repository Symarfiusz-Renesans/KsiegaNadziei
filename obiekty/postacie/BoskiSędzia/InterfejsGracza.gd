extends CanvasLayer

@onready var wyświetlacz_innych_broni = $"wyświetlaczInnychBroni"
@onready var główny_wyświetlacz = $"głównyWyświetlacz"

var czyChować = true

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_używana_broń_mouse_entered():
	wyświetlacz_innych_broni.czyWysunąć(true)

func _on_używana_broń_mouse_exited():
	wyświetlacz_innych_broni.czyWysunąć(false)
