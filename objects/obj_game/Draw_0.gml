switch(room) {
	
	case level1 || level2:
		draw_text(30, 30, "Health: " + string(health));
		break;
	
	case startscreen:
		var c = c_fuchsia;
		draw_set_halign(fa_center);
		draw_text_transformed_color(room_width/2, 100, "Gimme Grapple", 3, 3, 0, c, c, c, c, 1);
		break;

}