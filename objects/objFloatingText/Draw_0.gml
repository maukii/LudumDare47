draw_set_font(fntPickup);
draw_set_halign(fa_center);

var c = c_white;
var rot = scrWave(-20, 20, 2, 0);
draw_text_transformed_color(x, y, txt, 1, 1, rot, c, c, c, c, alpha);