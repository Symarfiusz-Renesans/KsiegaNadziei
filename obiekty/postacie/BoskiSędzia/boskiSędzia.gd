extends GrywalnaPostać

var czyJestPauza: bool = false
var czyByłNiewidoczny: bool = false

func _physics_process(delta):
	if self.visible:
		kontrolaRuchu(delta)
	
	if Input.is_action_just_pressed("pauza"):
		czyJestPauza = !czyJestPauza
		if czyJestPauza and !self.visible:
			self.visible = true
			czyByłNiewidoczny = true
		elif czyByłNiewidoczny:
			self.visible = false
			czyByłNiewidoczny =false
