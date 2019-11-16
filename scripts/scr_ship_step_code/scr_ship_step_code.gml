/// за управление отвечает obj_ship_controller

// навигация
scr_navigate()

// прицеливание и стрельба
if !(reloading - time_to_reload) {
	reloading++ 
}
else {
	if obj_aim.visible
		scr_shoot()
}

if !hull_durability
	scr_destroy()