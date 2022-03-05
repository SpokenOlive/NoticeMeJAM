if (place_meeting(x,y,o_solid) || hit) {
	instance_destroy();
}

var nx = x + (spd * dir * global.time);
var list = ds_list_create();
collision_line_list(x,y,nx,y,p_actor,false,false,list,true);
if (ds_list_size(list) > 0) {
	for (var i = 0; i < ds_list_size(list); i++) {
		if (list[| i].id != owner) {
			list[| i].actor_take_damage(dir*-1,dmg,noone);
			hit = true;
			break;
		}
	}
}

ds_list_destroy(list);

x = nx;