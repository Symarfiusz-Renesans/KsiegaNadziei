extends CanvasLayer

@onready var wyświetlacz_innych_broni = $"wyświetlaczInnychBroni"
@onready var główny_wyświetlacz = $"głównyWyświetlacz"
@onready var używana_broń = $"głównyWyświetlacz/UżywanaBroń"
@onready var nazwa_broni = $"głównyWyświetlacz/NazwaBroni"
@onready var amunicja = $"głównyWyświetlacz/Amunicja"
@onready var broń_1 = $"wyświetlaczInnychBroni/broń1"
@onready var broń_2 = $"wyświetlaczInnychBroni/broń2"

var głównaBroń = [preload("res://rysunki/UI/interfejsGracza/787-short.png"), "787 Short", "6 / 18"]
var podręcznaBroń = [preload("res://rysunki/UI/interfejsGracza/Commando.png"), "Commando", "6 / 24"]
var białaBroń = [preload("res://rysunki/UI/interfejsGracza/Bagnet.png"), "Bagnet", ""]

var używanaBroń = głównaBroń

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


func _on_broń2_pressed():
	match używanaBroń:
		głównaBroń:
			broń_1.texture_normal = głównaBroń[0]
			broń_2.texture_normal = podręcznaBroń[0]
			używana_broń.texture = białaBroń[0]
			używanaBroń = białaBroń
		podręcznaBroń:
			broń_1.texture_normal = głównaBroń[0]
			broń_2.texture_normal = podręcznaBroń[0]
			używana_broń.texture = białaBroń[0]
			używanaBroń = białaBroń
		białaBroń:
			broń_1.texture_normal = głównaBroń[0]
			broń_2.texture_normal = białaBroń[0]
			używana_broń.texture = podręcznaBroń[0]
			używanaBroń = podręcznaBroń
	
	nazwa_broni.text = używanaBroń[1]
	amunicja.text = używanaBroń[2]


func _on_broń1_pressed():
	match używanaBroń:
		głównaBroń:
			broń_1.texture_normal = głównaBroń[0]
			broń_2.texture_normal = białaBroń[0]
			używana_broń.texture = podręcznaBroń[0]
			używanaBroń = podręcznaBroń
		podręcznaBroń:
			broń_1.texture_normal = podręcznaBroń[0]
			broń_2.texture_normal = białaBroń[0]
			używana_broń.texture = głównaBroń[0]
			używanaBroń = głównaBroń
		białaBroń:
			broń_1.texture_normal = podręcznaBroń[0]
			broń_2.texture_normal = białaBroń[0]
			używana_broń.texture = głównaBroń[0]
			używanaBroń = głównaBroń
	
	nazwa_broni.text = używanaBroń[1]
	amunicja.text = używanaBroń[2]


func _on_przycisk_graj_pressed():
	Gedzba.grajGędźbę()

func _on_przycisk_stój_pressed():
	Gedzba.zatrzymajGędźbę()

func _on_przycisk_cofnij_pressed():
	Gedzba.cofnijGędźbę()
