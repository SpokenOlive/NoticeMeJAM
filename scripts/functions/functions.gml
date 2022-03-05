function LOG(str) {
	show_debug_message(".> " + string(str));
}

function value_approach(value,target,inc) {
	if (value > target) {
		value -= inc;
		if (value < target) {
			return target;
		}
	}
	else if (value < target) {
		value += inc;
		if (value > target) {
			return target;
		}
	}
	
	return value;
}