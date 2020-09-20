x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);



if (place_meeting(x,y, obj_wall)) && (image_index != 0) {
	
	while (place_meeting(x,y,obj_wall)) {
	
		x -= lengthdir_x(1,dir);
		y -= lengthdir_y(1,dir);
		
	}
	spd = 0;
	instance_destroy();
}