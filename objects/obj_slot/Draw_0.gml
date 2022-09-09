/// @description 

draw_self();

//Desenhando o meu item, caso eu possua um

//Iniciando variaveis basicas
var iid = global.inv[# var_slot, 0];
var qtd = global.inv[# var_slot, 1];

if(iid != item.none){
	//Desenhando a sprite
	draw_sprite(spr_item, iid, x, y);
	
	//Desenhando a quantidade
	draw_text(x + 4, y + 4, string(qtd));
}

//Desenhando a descrição
var mouse_sobre = position_meeting(mouse_x, mouse_y, self);

//Checando se tem item
if(mouse_sobre && iid != item.none){
	//Timer vai começar a contar
	timer++;
	if(timer >= room_speed /	2){
		transp = lerp(transp, 1, .03);
		draw_set_alpha(transp);
		//Garantindo que o valor do timer não fique muito alto
		timer = room_speed * 2;
		var w = sprite_width ;
		var h = sprite_height;
		
		draw_set_color(c_aqua);
		//Desenhando o retangulo
		draw_rectangle(x + w / 2, y + h, x + w + w / 2 + w * 5, y + h * 3, false);
		draw_set_color(-1);
		
		//Desenhando o texto
		draw_set_color(c_white);
		draw_set_font(fnt_desc);
		
		switch(global.item_index[# iid, item_stat.tipo]){
				case 1:{//Meu item é uma arma
					var info = "Dano: " + string(global.item_index[# iid, item_stat.dano]);
					break;
				}
				case 2:{//Meu item é de cura
					var info = "Cura: " + string(global.item_index[# iid, item_stat.cura]);
					break;
				}
				
				default: {
					var info = "";
					break;
				}
		}
		
		var texto = string(global.item_index[# iid, item_stat.desc]) + "\n" + info;
		
		var sep = string_height(texto);
		
		draw_text_ext(x + w / 2 + 4, y + h + 4, texto, 20, w * 4);
		draw_set_font(-1);
		draw_set_color(-1);
		draw_set_alpha(1);
	}
}else {
	//Mouse não esta sobre mim
	timer = 0;
}