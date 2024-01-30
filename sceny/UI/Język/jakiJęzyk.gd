extends Label

@onready var ścieżkaDoPlikuZDostępnymiJęzykami = "res://sceny/UI/Język/języki.txt"
@onready var ścieżkaDoPlikuZGłównymiDanymi = "res://DaneGry/główneDane.txt"
var językDomyślny;
var języki = []
var liczba: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	językDomyślny = znajdźJęzykDomyślny(ścieżkaDoPlikuZGłównymiDanymi)
	załadujPlik(ścieżkaDoPlikuZDostępnymiJęzykami, językDomyślny)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = " "+języki[liczba]+" "

func załadujPlik(ścieżka: String, język: String):
	var plik = FileAccess.open(ścieżka, FileAccess.READ)
	var index=0
	while not plik.eof_reached():
		var linijka = plik.get_line()
		języki.append(linijka)
		if język == języki[index]:
			liczba = index
		else:
			index += 1
	plik.close()

func znajdźJęzykDomyślny(ścieżka: String):
	var plik = FileAccess.open(ścieżka, FileAccess.READ)
	var tabela = []
	while not plik.eof_reached():
		var linijka = plik.get_line()
		tabela = linijka.split(": ")
		if tabela[0] == "wybranyJęzyk":
			plik.close()
			return tabela[1]

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
