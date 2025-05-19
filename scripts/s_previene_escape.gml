// arg0: id de instancia
// arg1: true si es terrestre, false aereo

with argument0 {
    x = clamp(x, 64, room_width - 64);
    y = clamp(y, 200, room_height - 64);
    if argument1 {
        if s_mizona(x, y) {
            antesuelo_x = x; antesuelo_y = y;
        }
        else {
            x = antesuelo_x; y = antesuelo_y;
        }
    }
}
