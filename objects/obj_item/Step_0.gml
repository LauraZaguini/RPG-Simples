/// @description 

//Colidindo com o player
var col = instance_place(x, y, obj_player);
if(col){
	//Se eu conseguir ser adicionado ao inventario do player
	if(scr_ganha_item(iid, qtd)){
		instance_destroy();	
	}
}