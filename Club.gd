extends RigidBody

export var rotation_speed := 0.1;
export var camera_path : NodePath

onready var _camera := get_node(camera_path) as Camera

var mouse_delta := 0

func _physics_process(delta):
	# Process accumulated mose movements in phisics_process
	var delta_rotation = mouse_delta * rotation_speed * delta;
	var axis = Vector3.FORWARD.cross(_camera.rotation.normalized())
	rotate(axis, delta_rotation)
	mouse_delta = 0

func _input(event):
	# Accumulate mouse relative movements
	if event is InputEventMouseMotion:
		mouse_delta += event.relative.x