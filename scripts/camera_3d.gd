extends Camera3D

@export var target: Node3D 
@export var follow_speed: float = 5.0
@export var offset: Vector3 = Vector3(0, 2, -4) 

func _process(delta):
	if target:
		var target_position = target.global_transform.origin + offset
		global_transform.origin = global_transform.origin.lerp(target_position, follow_speed * delta)
		look_at(target.global_transform.origin, Vector3.UP)
