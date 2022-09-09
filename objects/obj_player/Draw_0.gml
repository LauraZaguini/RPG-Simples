/// @description 

draw_self();

//Desenhando a barra de vida
var pc;
pc = (vida / max_vida) * 100;

draw_healthbar(x - 32, y - 32, x + 32, y - 48, pc, c_black, c_red, c_lime, 0, true, true);