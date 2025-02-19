extends CharacterBody3D

const SPEED = 7.0
const JUMP_VELOCITY = 4.5

@onready var charlie = $Charlie
@onready var anim_player = $Charlie/AnimationPlayer

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if anim_player and anim_player.has_animation("jump"):
			anim_player.play("jump")

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(-input_dir.x, 0, -input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		charlie.look_at(global_transform.origin - direction)

		if anim_player and anim_player.has_animation("walk"):
			anim_player.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
		if anim_player and anim_player.has_animation("idle"):
			anim_player.play("idle")

	move_and_slide()
