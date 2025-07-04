extends CharacterBody3D

@export var speed = 5.0
@export var gravity = -9.8
@export var jump_velocity = 5.0

var velocity = Vector3.ZERO

func _physics_process(delta):
    var input_dir = Vector3.ZERO

    if Input.is_action_pressed("ui_up"):
        input_dir.z -= 1
    if Input.is_action_pressed("ui_down"):
        input_dir.z += 1
    if Input.is_action_pressed("ui_left"):
        input_dir.x -= 1
    if Input.is_action_pressed("ui_right"):
        input_dir.x += 1

    input_dir = input_dir.normalized()

    velocity.x = input_dir.x * speed
    velocity.z = input_dir.z * speed

    velocity.y += gravity * delta

    if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
        velocity.y = jump_velocity

    velocity = move_and_slide(velocity, Vector3.UP)
