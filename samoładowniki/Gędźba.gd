extends Node

var gędźba = load("res://Gędźba/Push Cart Boom Boom.mp3")
var efekt = load("res://Gędźba/mountOven.mp3")

@onready var węzełOdGędźby = $"WęzełOdGędźby"
@onready var węzełOdEfektów = $"WęzełOdEfektów"
# Called when the node enters the scene tree for the first time.
func puśćGędźbę():
	
	węzełOdGędźby.stream = gędźba
	węzełOdGędźby.play()
