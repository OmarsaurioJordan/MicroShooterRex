// arg0: punto x
// arg1: punto y
// ret: true si esta en suelo, false en vacio

var xx = clamp(argument0 / m_mapa_celda, 0, ds_grid_width(o_mundo.zona) - 1);
var yy = clamp(argument1 / m_mapa_celda, 0, ds_grid_height(o_mundo.zona) - 1);
return ds_grid_get(o_mundo.zona, xx, yy);
