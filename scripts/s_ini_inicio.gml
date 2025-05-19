// guarda los datos del jugador

ini_open("config.ini");
with o_boton {
    switch tipo {
        case m_boton_nombre: ini_write_string("juego", "nombre", texto); break;
        case m_boton_zombie: ini_write_string("juego", "zombie", string(activo)); break;
        case m_boton_bandera: ini_write_string("juego", "bandera", string(activo)); break;
        case m_boton_regalos: ini_write_string("juego", "regalos", string(activo)); break;
        case m_boton_pirata: ini_write_string("juego", "pirata", string(activo)); break;
        case m_boton_fuerte: ini_write_string("juego", "fuerte", string(activo)); break;
        case m_boton_otro: ini_write_string("juego", "otro", string(activo)); break;
    }
}
ini_write_string("juego", "grupo", string(o_menu.grupo));
ini_write_string("juego", "pelo", string(o_menu.pelo));
ini_write_string("juego", "genero", string(o_menu.genero));
ini_close();
