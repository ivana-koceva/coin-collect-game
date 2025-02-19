extends Area3D

signal itemCollected

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Character":
		$Timer.start()
		
func _on_timer_timeout() -> void:
	emit_signal("itemCollected")
	queue_free()
