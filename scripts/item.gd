class_name Item
extends RigidBody3D

@onready var grab_area: Area3D = $Area3D

var locked: bool = false

func _ready() -> void:
	grab_area.body_entered.connect(_on_body_entered)
	grab_area.body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node3D) -> void:
	if not locked and body is ControllerExtended:
		(body as ControllerExtended).push_item(self)


func _on_body_exited(body: Node3D) -> void:
	if body is ControllerExtended:
		(body as ControllerExtended).erase_item(self)
