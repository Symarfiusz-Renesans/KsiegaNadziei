extends MarginContainer

var czyPrzenosić = false
var kier;
var prędkość = 0
var drogaX = 1150

func _process(delta):
	if czyPrzenosić:
		match kier:
			"góra":
				self.position.y -= prędkość*delta
				prędkość += 5
			"dół":
				self.position.y += prędkość*delta
				prędkość += 5
			"prawo":
				if(-drogaX < self.position.x):
					self.position.x -= prędkość*delta
				else:
					self.position.x = -drogaX
				if (self.position.x <= -drogaX/2):
					if (prędkość > 0):
						prędkość -= 5
					else:
						prędkość = 0
				else:
					prędkość += 5
			"lewo":
				if(0 > self.position.x):
					self.position.x += prędkość*delta
				else:
					self.position.x = 0
				if (self.position.x >= -drogaX/2):
					if (prędkość > 0):
						prędkość -= 5
					else:
						prędkość = 0
				else:
					prędkość += 5

func ustalDane(gdzie: String):
	czyPrzenosić = true
	kier = gdzie
