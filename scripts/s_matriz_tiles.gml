// arg0: mapa a ser dibujado

// m_mapa_celda es la talla en px de una casilla, seria el radio del tile

// crear los tilesets para el fondo del mundo
for (var w = 0; w < ds_grid_width(argument0); w++) {
    for (var h = 0; h < ds_grid_height(argument0); h++) {
        if ds_grid_get(argument0, w, h) {
            tile_add(db_suelo, 0, 0, 64, 360,
                m_mapa_celda * w - 16, m_mapa_celda * h - 16,
                -(m_mapa_celda * h - 16 - 32));
        }
    }
}
