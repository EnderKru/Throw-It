extends Node3D

func _ready():
	var xr_iface = XRServer.find_interface("OpenXR")
	if xr_iface and xr_iface.is_initialized():
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
