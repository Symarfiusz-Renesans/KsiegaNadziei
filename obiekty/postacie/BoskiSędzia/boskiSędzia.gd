extends GrywalnaPostać

func _physics_process(delta):
	if self.visible:
		kontrolaRuchu(delta)
