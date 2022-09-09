/// @description 

var lista_dano = ds_list_create();
//Se foi o player me criou, não preciso checar ele
if(!checa_player){
	//Então eu checo os inimigos
	var col = instance_place_list(x, y, obj_entidade, lista_dano, false);
}else {//Foi o inimigo que me criou
	var col = instance_place_list(x, y, obj_player, lista_dano, false);
}

//Executar o dano
if(col){
	var size = ds_list_size(lista_dano);
	for(var i = 0; i < size; i++){
		//Aqui o codigo para gerenciar o dano
		var outro = lista_dano[| i];
		//Ter certeza que não vou afetar o meu criador
		if(outro != pai){
			outro.vida -= dano;
			outro.estado = "dano";
			outro.dir = dire;
		}
	}
}

ds_list_destroy(lista_dano);
instance_destroy();