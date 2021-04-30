
scr_debug_showVar("omega_sign", omega_sign)
scr_debug_showVar("omega", omega)
scr_debug_showVar("rc", rc)
scr_debug_showVar("correct", correct)


// omega_sign = sign(rel_target_dir)
// omega = rotation_sp * omega_sign
// rc = 1000
// if omega != 0
// 	rc = sp / omega
// xc = -rc * sin(image_angle) * omega_sign
// yc = -rc * cos(image_angle) * omega_sign
