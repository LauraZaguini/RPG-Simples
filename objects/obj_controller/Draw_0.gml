/// @description 

//Desenhando o item no mouse
var iid = global.mouse_slot[# 0, 0];
var qtd = global.mouse_slot[# 0, 1];

//Se estou com item no mouse
if(iid != item.none){
	var w = sprite_get_width(spr_item)/2;
	//Desenhando a sprite do item
	draw_sprite(spr_item, iid, mouse_x - w, mouse_y - w);
	//Desenhando a quantidade do item
	draw_text(mouse_x - w + 4, mouse_y - w + 4, string(qtd));
}


//draw_sprite(spr_item, item.banana, mouse_x, mouse_y);

/*
//Exibindo toda a grid
for(var i = 0; i < item.total; i++){//Colunas
	var w = sprite_get_width(spr_item) * 2;
	var sep = string_height("oi");
	
	//Desenhando sprite
	draw_sprite(spr_item, i, i * w, 4);
		for(var j = 0; j < item_stat.total; j++){//Linhas
				draw_text_ext(w * i, w * j + w, global.item_index[# i, j], sep, w);
		}
}*/

/*
for(var i = 0; i < 10; i++){
	draw_sprite(spr_item, global.inv[# i, 0], 64 * i, 0);
	draw_text(i * 64, 64, global.inv[# i, 0]);	
}*/