// arg0: ind de grupo
// ret: color

var res = c_white;
switch argument0 {
    case m_grupo_rojo: res = make_colour_rgb(240, 100, 70); break;
    case m_grupo_azul: res = make_colour_rgb(90, 130, 240); break;
    case m_grupo_verde: res = make_colour_rgb(70, 230, 40); break;
    case m_grupo_amarillo: res = make_colour_rgb(230, 240, 90); break;
    case m_grupo_agua: res = make_colour_rgb(110, 230, 240); break;
    case m_grupo_morado: res = make_colour_rgb(240, 100, 240); break;
}
return res;
