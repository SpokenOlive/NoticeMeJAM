var fs = (spd * global.time);
var nx = x + lengthdir_x(fs,dir);
var ny = y + lengthdir_y(fs,dir);
var list = ds_list_create();
collision_line_list(x,y,nx,ny,target,false,false,list,true);
if (ds_list_size(list) > 0) {
	for (var i = 0; i < ds_list_size(list); i++) {
		var actor = list[| i]
		if (actor.id != owner && actor.state != a_states.die && actor.state != a_states.dead) {
			if (actor.actor_take_hit(sign(x-actor.x),dmg,type)) {
				hit = true;
				break;
			}
		}
	}
}

ds_list_destroy(list);

if (!in_cam_view(nx,ny) || place_meeting(nx,ny,o_solid) || hit) {
	instance_destroy();
}
else {
	x = nx;
	y = ny;
}