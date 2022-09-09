/// @description 

var item_criado = instance_create_layer(x, y, "Instances", obj_item);
item_criado.iid = irandom_range(1, item.total - 1);
item_criado.image_index = item_criado.iid;
item_criado.image_speed = 0;
item_criado.qtd = 1;