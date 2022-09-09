/// @description 

//Iniciando os items
enum item{
	none,
	banana,
	uva,
	espada,
	cajado,
	pera,
	bota,
	escudo,
	tomate,
	arco,
	bomba,
	lanca,
	capacete,
	manto,
	total
}

//Dando informações do item
enum item_stat{
	nome,
	desc,
	tipo,
	dano,
	cura,
	total
}

enum item_tipo{
	none,
	arma,
	cura
}

global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0);
//Espada
scr_cria_item(item.espada, "Espada", "Espada comum!", item_tipo.arma, 2, 0);
//Banana
scr_cria_item(item.banana, "Banana", "Uma banana super deliciosa!", item_tipo.cura, 0, 20);
//Uva
scr_cria_item(item.uva, "Uva", "Uma uva fresquisa", item_tipo.cura, 0, 5);
//Cajado
scr_cria_item(item.cajado, "Cajado", "Cajado poderoso", item_tipo.arma, 10, 0);
//Bota
scr_cria_item(item.bota, "Bota", "Uma bota com super velocidade", item_tipo.arma, 1, 0);
//Escudo
scr_cria_item(item.escudo, "Escudo", "Um escudo protetor", item_tipo.arma, 1, 0);
//Sopa
scr_cria_item(item.arco, "Sopa", "Uma sopa deliciosa", item_tipo.cura, 0, 7);
//Tomate
scr_cria_item(item.tomate, "Tomate", "Apenas um tomate.", item_tipo.cura, 0, 3);
//Pera
scr_cria_item(item.pera, "Pera", "Uma perazinha", item_tipo.cura, 0, 5);
//Bomba
scr_cria_item(item.bomba, "Bomba", "Uma bomba super poderosa", item_tipo.arma, 10, 0);
//Lança
scr_cria_item(item.lanca, "Lança", "Lança para ser jogado nos seus inimigos", item_tipo.arma, 15, 0);
//Capacete
scr_cria_item(item.capacete, "Capacete", "Protega o seu cabeção com esse capacete", item_tipo.arma, 1, 0);
//Manto
scr_cria_item(item.manto, "Manto", "Um manto capaz de curar 5 de hp a cada 5 segundos andando", item_tipo.cura, 0, 5);



//Debug apenas
//scr_cria_item(item.none, "Nome", "Desc", "Tipo", "Dano", "Cura");

//Criando inventario do player
global.inv = ds_grid_create(10, 2);
ds_grid_clear(global.inv, 0);

//Iniciando os slots
var tam = ds_grid_width(global.inv);

for(var i = 0; i < tam; i++){
	var w = sprite_get_width(spr_slot);
	var pos_x = i * w + 8;
	var s = instance_create_layer(pos_x, 8, "HUD", obj_slot);
	s.var_slot = i;
	s.pos_x = pos_x;
	s.pos_y = 8;
}

//Iniciando a grid do mouse
global.mouse_slot = ds_grid_create(1, 2);
ds_grid_clear(global.mouse_slot, 0);

if(!instance_exists(obj_player)){
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);	
}

//Recuperando os dados salvos
ini_open("Save.ini");

var ds_inv = ini_read_string("Itens", "inv", "NULO");

var player_maxvida = ini_read_real("Player", "max_vida", 0);
var player_vida = ini_read_real("Player", "vida", 0);
var player_arma = ini_read_real("Player", "arma", 0);

//Aplicando os valores ao jogo
ds_grid_read(global.inv, ds_inv);
if(instance_exists(obj_player)){
	//Checando se eu ja havia algum valor antes
	if(player_maxvida > 0){
		obj_player.max_vida = player_maxvida;
		obj_player.vida = player_vida;
		obj_player.arma = player_arma;
	}
}

ini_close();