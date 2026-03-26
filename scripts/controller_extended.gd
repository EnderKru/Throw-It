class_name ControllerExtended
extends XRController3D

@export var throw_velocity_multiplier: float = 1.5

const VELOCITY_HIST_SIZE = 5

var _visible_items: Array[Item] = []
var _grabbed_item: Item = null

var _position_history: Array = []
var _time_history: Array = []


func _ready() -> void:
	button_pressed.connect(_on_button_pressed)
	button_released.connect(_on_button_released)


func _physics_process(delta: float) -> void:
	if _grabbed_item:
		_record_position()
		_grabbed_item.global_position = global_position
		_grabbed_item.global_rotation = global_rotation


func _record_position() -> void:
	_position_history.append(global_position)
	_time_history.append(Time.get_ticks_msec() / 1000.0)

	if _position_history.size() > VELOCITY_HIST_SIZE:
		_position_history.pop_front()
		_time_history.pop_front()


func _calculate_hand_velocity() -> Vector3:
	if _position_history.size() < 2:
		return Vector3.ZERO

	var oldest_pos: Vector3 = _position_history[0]
	var newest_pos: Vector3 = _position_history[-1]
	var time_delta: float = _time_history[-1] - _time_history[0]

	if time_delta <= 0.0:
		return Vector3.ZERO

	return (newest_pos - oldest_pos) / time_delta


func _on_button_pressed(button_name: String) -> void:
	if button_name == "grip_click":
		_try_grab()


func _on_button_released(button_name: String) -> void:
	if button_name == "grip_click":
		_throw()


func _try_grab() -> void:
	if _grabbed_item or _visible_items.is_empty():
		return

	_remove_locked(_visible_items)

	if _visible_items.is_empty():
		return

	var closest := _visible_items[0]
	var closest_dist := global_position.distance_to(_visible_items[0].global_position)

	for item in _visible_items:
		var current_dist := global_position.distance_to(item.global_position)
		if current_dist < closest_dist:
			closest = item
			closest_dist = current_dist

	_grabbed_item = closest
	_grabbed_item.locked = true

	_grabbed_item.freeze = true
	_grabbed_item.global_position = global_position
	_grabbed_item.global_rotation = global_rotation

	print("Grabbed: ", _grabbed_item.name)


func _remove_locked(items: Array[Item]) -> void:
	for i in range(items.size() - 1, -1, -1):
		if items[i].locked:
			items.remove_at(i)


func _throw() -> void:
	if not _grabbed_item:
		return

	var hand_velocity: Vector3 = _calculate_hand_velocity()

	_grabbed_item.freeze = false
	_grabbed_item.linear_velocity = hand_velocity * throw_velocity_multiplier
	_grabbed_item.angular_velocity = Vector3.ZERO

	print("Thrown: ", _grabbed_item.name, " velocity: ", hand_velocity)

	_grabbed_item.locked = false
	_grabbed_item = null
	_position_history.clear()
	_time_history.clear()

func push_item(item: Item) -> void:
	if not _visible_items.has(item):
		_visible_items.append(item)

func erase_item(item: Item) -> void:
	if _visible_items.has(item):
		_visible_items.erase(item)
