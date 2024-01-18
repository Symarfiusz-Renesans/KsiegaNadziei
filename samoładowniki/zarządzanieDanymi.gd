extends Node

var ścieżkaDoPliku = "res://DaneGry/główneDane.txt"

func nadpiszDane(zCzego: String, naCo: String):
	var tekst = ""
	var plik = FileAccess.open(ścieżkaDoPliku, FileAccess.READ)
	while not plik.eof_reached():
		var linijka = plik.get_line()
		var podziałka = linijka.split(": ")
		if podziałka[0] == zCzego:
			tekst += zCzego + ": " + naCo + "\n"
		else:
			tekst += linijka + "\n"
	plik = FileAccess.open(ścieżkaDoPliku, FileAccess.WRITE)
	plik.store_string(tekst)
	plik.close()

func znajdźDane(zCzego: String):
	var tekst
	var plik = FileAccess.open(ścieżkaDoPliku, FileAccess.READ)
	while not plik.eof_reached():
		var linijka = plik.get_line()
		var podziałka = linijka.split(": ")
		if podziałka[0] == zCzego:
			tekst=podziałka[1]
			break
	return tekst
