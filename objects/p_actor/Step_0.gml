// =====================
// STATES
// =====================
switch (state) {
	case a_states.hurt : 		
		stun_timer -= stun_timer_inc * global.time;
		if (stun_timer <= 0) {
			stun_timer	= 0;
			state		= a_states.idle;
			knockback	= false;
		}
	break;
	case a_states.melee : 
		if (!have_shot && image_index >= melee_hit_frame) {
			have_shot	= true;
			var list	= ds_list_create();
			var x1		= x;
			var y1		= y-melee_height-melee_depth/2;
			var x2		= x1 + melee_reach*image_xscale;
			var y2		= y1 + melee_depth;
			collision_rectangle_list(x1,y1,x2,y2,target,false,false,list,true);
			if (ds_list_size(list) > 0) {
				for (var i = 0; i < ds_list_size(list); i++) {
					var actor = list[| i]
					if (actor.actor_take_hit(image_xscale*-1,attack_damage,damage_type)) {
						break;
					}
				}
			}
			ds_list_destroy(list);
		}
	break;
	case a_states.launch :
		if (!have_shot && image_index >= launch_frame) {
			have_shot	= true;
			with (instance_create_layer(x+52*image_xscale,y-72,layer,projectile)) {
				owner	= other.id;
				target	= owner.target;
				dir		= other.shot_dir;
				spd		= other.shot_spd;
				dmg		= 1;
				type	= owner.damage_type;
			}
		}
	break;
}

// =====================
// APPLY MOVEMENT
// =====================
if (!grav_exempt) {
	vspd += ((vspd < 0) ? grav : grav * 1.5)*global.time;
}

hspd = clamp(hspd, -hspd_max*global.time, hspd_max*global.time);
vspd = clamp(vspd, -vspd_max*global.time, vspd_max*global.time);

hit_wall = false;

if (place_meeting(x+hspd,y,o_solid)) {
	var inc = sign(hspd);
	while(!place_meeting(x+inc,y,o_solid)) {
		x += inc;
	}
	hspd = 0;
	hit_wall = true;
}
x += hspd;

if (place_meeting(x,y+vspd,o_solid)) {
	var inc = sign(vspd);
	while(!place_meeting(x,y+inc,o_solid)) {
		y += inc;
	}
	vspd = 0;
}
y += vspd;

on_floor = place_meeting(x,y+1,o_solid);