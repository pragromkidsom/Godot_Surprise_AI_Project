extends CharacterBody3D

@export var player: NodePath
var speed = 2.5

func _physics_process(delta):
	if player == null:
		return
	var target = get_node(player)
	if target == null:
		return

	var direction = (target.global_transform.origin - global_transform.origin)
	direction.y = 0
	direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()