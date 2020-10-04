//Init values here if you want to

function scrApproach(value, to, amount){
	/// Approach(a, b, amount)
	///@param value
	///@param destination
	///@param amount
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice because it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);
 
	if (value < to)
	{
	    value += amount;
	    if (value > to) return to;
	}
	else
	{
	    value -= amount;
	    if (value < to) return to;
	}
	return value;
}

function scrWave(from, to, duration, offset){
	///Wave(from, to, duration, offset)
	///@param from
	///@param to
	///@param duration
	///@param offset
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function scrWave2(from, to, duration, offset){
	///Wave(from, to, duration, offset)
	///@param from
	///@param to
	///@param duration
	///@param offset
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	var a4 = (to - from) * 0.5;
	return from + a4 + cos((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function scrOffscreen() {
	//Despawn
	if (x < -sprite_width || x > room_width + sprite_width) {
		return true;
	} else if (y < -sprite_height || y > room_height + sprite_height) {
		return true;
	} else {
		return false;
	}
}