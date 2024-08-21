extends Camera2D

var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 20)) ##lerp = linear interpolate
	##math above in lerp is to create smoothing, required number will be off of frames typically,
	##so the exponential subtraction gives a number that functions independent from the frame rate

func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D ## as used to tell godot the type so intellisence can help
		target_position = player.global_position

