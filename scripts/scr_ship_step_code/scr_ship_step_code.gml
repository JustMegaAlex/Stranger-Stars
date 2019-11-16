/// за управление отвечает obj_ship_controller

// навигация
scr_navigate()

// прицеливание и стрельба
if !(reloading+1 - weapon_full_charge) {
	reloading = min(reloading + reload_sp, weapon_full_charge)
}
else {
	if obj_aim.visible
		scr_shoot()
}

if !hull_durability
	scr_destroy()