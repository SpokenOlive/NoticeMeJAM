var nx = x + (spd * dir * global.time);
var list = ds_list_create();
collision_line_list(x,y,nx,y,p_actor,false,false,list,true);
if (ds_list_size(list) > 0) {
	for (var i = 0; i < ds_list_size(list); i++) {
		var actor = list[| i]
		if (actor.id != owner && actor.state != a_states.die && actor.state != a_states.dead) {
			if (actor.actor_take_hit(dir*-1,dmg,type)) {
				hit = true;
				break;
			}
		}
	}
}

ds_list_destroy(list);

if (!in_cam_view(x,y) || place_meeting(nx,y,o_solid) || hit) {
	instance_destroy();
}
else {
	x = nx;
}