/// updates variables of debug scripts
/// it's suggested to put this into some head object
/// in which scr_debugINI() is called
function scr_debug_scripts_update() {
	global.VAR_BAR_LENGTH = 0
	global.VAR_BAR_X = 30
	global.VAR_BAR_Y = 30
}

function scr_debug_showGrid(grid, x0, y0) {
	var i, j, grid, x0, y0
	for(i=0;i<ds_grid_width(grid); i+=1) {
	    for(j=0; j<ds_grid_height(grid); j+=1) {
	        draw_text(x0 + 50 * i, y0 + 20 * j, string(ds_grid_get(grid, i, j)))
	    }
	}
}

function scr_debug_showList(list, x0, y0) {
	var i, list, x0, y0
	for(i=0; i<ds_list_size(list); i+=1) {
	    draw_text(x0, y0 + 20*i, string(ds_list_find_value(list, i)))
	}
}

function scr_debugINI() {
	global.VAR_BAR_LENGTH = 0
	global.VAR_BAR_X = 0
	global.VAR_BAR_Y = 0
	global.VAR_BAR_ROW_DELTA = 20
}