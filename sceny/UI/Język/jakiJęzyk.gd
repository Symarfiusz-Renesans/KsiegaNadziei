extends Label

@onready var ścieżkaDoPliku = "res://sceny/UI/Język/języki.txt"
var języki = []
var liczba: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	załadujPlik(ścieżkaDoPliku)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = " "+języki[liczba]+" "

func załadujPlik(ścieżka: String):
	var plik = FileAccess.open(ścieżka, FileAccess.READ)
	var index = 1
	while not plik.eof_reached():
		var linijka = plik.get_line()
		języki.append(linijka)

func _on_w_lewo_pressed():
	if liczba > 0:
		liczba-=1
	else:
		liczba = języki.size()-1


func _on_w_prawo_pressed():
	if liczba < języki.size()-1:
		liczba+=1
	else:
		liczba = 0
