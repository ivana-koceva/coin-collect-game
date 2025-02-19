extends Label

@export var timer: Timer

func _ready() -> void:
	if timer:
		text = str(int(timer.time_left))
		
func _process(_delta: float) -> void:
	if timer:
		text = str(int(timer.time_left))
		
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://assets/LoseMenu.tscn")
