extends TextureRect

var wysuwać: bool = false
var cofać: bool = true
var szybkość = 1000

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (wysuwać):
		if self.position.y > 428:
			self.position.y -= szybkość*delta
		else:
			self.position.y = 428
	else:
		if cofać:
			if self.position.y < 540:
				self.position.y += szybkość*delta
			else:
				self.position.y = 540

func czyWysunąć(wysunąć: bool):
	wysuwać = wysunąć

func _on_mouse_entered():
	cofać = false

func _on_mouse_exited():
	cofać = true
