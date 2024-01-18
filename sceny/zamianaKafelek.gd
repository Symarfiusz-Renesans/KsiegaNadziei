extends TileMap

const CiemnyKorytarz = preload("res://obiekty/ciemnyKorytarz/ciemnyKorytarz.tscn")
const Szafka = preload("res://obiekty/szafka/szafka.tscn")

func _ready():
	var ciemneKorytarze = get_used_cells_by_id(1)
	var szafki = get_used_cells_by_id(2)
	#print(ciemneKorytarze)
	zastąpCiemneKorytarze(ciemneKorytarze)
	zastąpSzafki(szafki)

func zastąpCiemneKorytarze(tabelaKor: Array[Vector2i]):
	var miejsceKafelka
	for i in range(0, tabelaKor.size()):
		var nowyObiekt = CiemnyKorytarz.instantiate()
		miejsceKafelka = map_to_local(tabelaKor[i])
		print(tabelaKor[i])
		print(miejsceKafelka)
		nowyObiekt.position = Vector2(miejsceKafelka.x-32, miejsceKafelka.y-96)
		print(nowyObiekt.position)
		set_cell(1, tabelaKor[i], -1)
		self.add_child(nowyObiekt)

func zastąpSzafki(tabelaSzaf: Array[Vector2i]):
	var miejsceKafelka
	for i in range(0, tabelaSzaf.size()):
		var nowyObiekt = Szafka.instantiate()
		miejsceKafelka = map_to_local(tabelaSzaf[i])
		print(tabelaSzaf[i])
		print(miejsceKafelka)
		nowyObiekt.position = Vector2(miejsceKafelka.x-32, miejsceKafelka.y-32)
		print(nowyObiekt.position)
		set_cell(1, tabelaSzaf[i], -1)
		self.add_child(nowyObiekt)
