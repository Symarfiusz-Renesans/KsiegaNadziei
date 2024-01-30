extends Node

var gędźba = load("res://Gędźba/Push Cart Boom Boom.mp3")
var efekt = load("res://Gędźba/mountOven.mp3")

@onready var węzełOdGędźby = $"WęzełOdGędźby"
@onready var węzełOdEfektów = $"WęzełOdEfektów"

var zatrzymane = 0

func puśćGędźbę():
	węzełOdGędźby.stream = gędźba
	węzełOdGędźby.play()

func grajGędźbę():
	węzełOdGędźby.stream = gędźba
	węzełOdGędźby.play()
	węzełOdGędźby.seek(zatrzymane)

func zatrzymajGędźbę():
	zatrzymane = węzełOdGędźby.get_playback_position()
	węzełOdGędźby.stop()

func cofnijGędźbę():
	pass
