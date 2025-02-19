extends Label

var coins = 0
const MAX_COINS = 10

@onready var win_timer: Timer = $Timer

func _ready() -> void:
	text = str(coins)
	win_timer.timeout.connect(_on_timer_timeout)
		
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://assets/WinMenu.tscn")

func item_collected() -> void:
	coins += 1
	text = str(coins) 

	if coins == MAX_COINS:
		win_timer.start()
		
func _on_coin_golden_body_entered(_body: Node3D) -> void:
	item_collected()
	
func _on_coin_silver_body_entered(_body: Node3D) -> void:
	item_collected()

func _on_chest_body_entered(_body: Node3D) -> void:
	item_collected()
