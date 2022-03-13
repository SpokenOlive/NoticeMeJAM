// =====================
// STATES
// =====================
state = a_states.idle;

// =====================
// STATS
// =====================
hp_max = 10;
hp_cur = hp_max;

// =====================
// MOVEMENT
// =====================
hspd		= 0;
hspd_max	= 500;
haccel		= 20;
hdecel		= 50;
vspd		= 0;
vspd_max	= 1200;
grav		= 50;
jspd		= 25;

// =====================
// COMBAT
// =====================
target			= noone;
attack_damage	= 1;
damage_type		= damage_types.melee;
have_shot		= false;
knockback		= false;
melee_reach		= 0;
melee_height	= 0;
melee_depth		= 0;
melee_hit_frame	= 0;
shot_timer		= 0;
shot_timer_max	= 3;
shot_timer_inc	= 10;
stun_timer		= 0;
stun_timer_max	= 1;
stun_timer_inc	= 10;

// =====================
// FLAGS
// =====================
on_floor	= true;
hit_wall	= false;
attacking	= false;
gravity_exempt	= false;
invulnerable= false;

// =====================
// FUNCTIONS
// =====================
function actor_take_hit(dir,dmg,type) {
	if (invulnerable || state == a_states.die || state == a_states.dead) {
		return false;
	}
	
	hp_cur -= dmg;
	if (hp_cur <= 0) {
		hp_cur = 0;
		state = a_states.die;
	}
	else {
		hspd = 0;
		if (type == damage_types.melee) {
			knockback	= true;
		}
		if (knockback) {
			vspd		= -800*global.time;
			hspd		= hspd_max * dir * -1;
			stun_timer = stun_timer_max;
			state = a_states.hurt;
		}
	}
	return true;
}