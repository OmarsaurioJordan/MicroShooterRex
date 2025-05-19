// arg0: id instancia que sera manejada por teclas

with argument0 {
    var cntrl = s_control(id, false);
    // caminar
    var vertical = cntrl[0];
    var horizontal = vertical;
    if vertical == 2 or vertical == 3 or vertical == 4 {
        vertical = -100; }
    else if vertical == 1 or vertical == 5 or vertical == 0 {
        vertical = 0;}
    else {
        vertical = 100; }
    if horizontal == 4 or horizontal == 5 or horizontal == 6 {
        horizontal = -100; }
    else if horizontal == 3 or horizontal == 7 or horizontal == 0 {
        horizontal = 0;}
    else {
        horizontal = 100; }
    if vertical != 0 or horizontal != 0 {
        s_mover(id, x + horizontal, y + vertical, false);
    }
}
