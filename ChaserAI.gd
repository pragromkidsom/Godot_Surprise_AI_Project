extends CharacterBody3D

@export var speed = 4.0
@export var chase_distance = 15.0

var player = null
var velocity = Vector3.ZERO

func _ready():
    player = get_node_or_null("/root/Main/Player")  # Adjust this path to your player node

func _physics_process(delta):
    if player == null:
        return

    var distance = global_transform.origin.distance_to(player.global_transform.origin)
    if distance < chase_distance:
        var dir = (player.global_transform.origin - global_transform.origin).normalized()
        velocity = dir * speed
    else:
        velocity = Vector3.ZERO

    velocity = move_and_slide(velocity, Vector3.UP)
