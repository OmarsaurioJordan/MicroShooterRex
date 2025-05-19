// arg0: nombre del archivo .png a abrir
// ret: matriz binarios de suelo o vacio

// m_mapa_mundo es la relaccion proporcional de talla entre room y PNG
// m_mapa_celda es la talla en px de una casilla, seria el radio del tile

// crear el indice maximo de matriz para optimizar memoria
var zona = ds_grid_create(floor(room_width / m_mapa_celda), floor(room_height / m_mapa_celda));
// importar el mapa como tal en PNG y hacer la superficie para leerle pixeles
var figura = sprite_add(argument0, 1, false, false, 0, 0);
var mapa = surface_create(room_width / m_mapa_mundo, room_height / m_mapa_mundo);
surface_set_target(mapa);
draw_sprite(figura, 0, 0, 0);
surface_save(mapa, "actual_mapa.png"); // evita error
sprite_delete(figura);
// ciclo para obtener pixeles
var pix, esc;
esc = m_mapa_celda / m_mapa_mundo;
for (var w = 0; w < ds_grid_width(zona); w++) {
    for (var h = 0; h < ds_grid_height(zona); h++) {
        pix = surface_getpixel(mapa, w * esc, h * esc);
        if colour_get_value(pix) / 255 > 0.5 {
            ds_grid_set(zona, w, h, false); }
        else {
            ds_grid_set(zona, w, h, true); }
    }
}
// eliminar la superficie
surface_free(mapa);
surface_reset_target();
return zona;
