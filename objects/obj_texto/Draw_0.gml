/// @description 

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);
var caixa_w = sprite_get_width(spr_text_box);
var caixa_h = sprite_get_height(spr_text_box);

var tam_w = tam_inicio / caixa_w;

tam_inicio = lerp(tam_inicio, caixa_w, .05);

//Desenhando a sprite
draw_sprite_ext(spr_text_box, 0, xx, yy + view_h - caixa_h, tam_w, 1, 0, c_white, 1);

//Configurando a escrita do texto

texto_atual = string_copy(text[pag], 1, ind);
texto_limite = string_length(text[pag]);

if(ind < texto_limite){
	ind++;	
}


var sep = string_height(text[pag]);

draw_set_font(fnt_font);
draw_text_ext(xx + margem, yy + margem + view_h - caixa_h, texto_atual, sep, caixa_w - margem);

draw_set_font(-1);