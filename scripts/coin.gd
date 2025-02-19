extends Area3D

signal itemCollected

func _ready() -> void:
	pass 
	
func _physics_process(_delta: float) -> void:
	rotate_y(deg_to_rad(3))

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Character":
		$Timer.start()

func _on_timer_timeout() -> void:
	emit_signal("itemCollected")
	queue_free()
