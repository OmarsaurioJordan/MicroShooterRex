// arg0: id instancia a animar
// arg1: ind de la animacion actual
// arg2: periodo de la animacion
// arg3: amplitud del movimiento
// arg4: desfase del movimiento

with argument0 {
    var ant = round((reloj_anima[argument1] / argument2) * 16);
    reloj_anima[argument1] += dt;
    while reloj_anima[argument1] >= argument2 {
        reloj_anima[argument1] -= argument2;
    }
    var new = round((reloj_anima[argument1] / argument2) * 16);
    if new != ant {
        switch new {
            case 0: anima[argument1] = argument4; break;
            case 1: anima[argument1] = argument4 + argument3 * 0.3827; break;
            case 2: anima[argument1] = argument4 + argument3 * 0.7071; break;
            case 3: anima[argument1] = argument4 + argument3 * 0.9239; break;
            case 4: anima[argument1] = argument4 + argument3; break;
            case 5: anima[argument1] = argument4 + argument3 * 0.9239; break;
            case 6: anima[argument1] = argument4 + argument3 * 0.7071; break;
            case 7: anima[argument1] = argument4 + argument3 * 0.3827; break;
            case 8: anima[argument1] = argument4; break;
            case 9: anima[argument1] = argument4 - argument3 * 0.3827; break;
            case 10: anima[argument1] = argument4 - argument3 * 0.7071; break;
            case 11: anima[argument1] = argument4 - argument3 * 0.9239; break;
            case 12: anima[argument1] = argument4 - argument3; break;
            case 13: anima[argument1] = argument4 - argument3 * 0.9239; break;
            case 14: anima[argument1] = argument4 - argument3 * 0.7071; break;
            case 15: anima[argument1] = argument4 - argument3 * 0.3827; break;
            case 16: anima[argument1] = argument4; break;
        }
    }
}
