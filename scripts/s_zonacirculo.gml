// arg0: punto x
// arg1: punto y
// arg2: radio
// arg3: true si buscar suelo, false si buscar vacio
// ret: true si hallo la zona arg3

var xx = clamp(argument0 / m_mapa_celda, 0, ds_grid_width(o_mundo.zona) - 1);
var yy = clamp(argument1 / m_mapa_celda, 0, ds_grid_height(o_mundo.zona) - 1);
return ds_grid_value_disk_exists(o_mundo.zona, xx, yy, argument2 / m_mapa_celda, argument3);
