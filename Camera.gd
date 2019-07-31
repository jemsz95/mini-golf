extends Camera

class_name LockedCamera

export var target: NodePath

onready var _target = get_node(target) as Spatial

func _physics_process(delta):
	var target_position = _target.translation
	var up = Vector3(0, -rotation.y, 0)
	self.transform = transform.looking_at(target_position, up)