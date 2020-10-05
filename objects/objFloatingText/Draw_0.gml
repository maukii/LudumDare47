draw_set_font(fntPickup);
draw_set_halign(fa_center);

var c = global.textHighlightColor;
var rot = scrWave(-20, 20, 2, 0);
draw_text_transformed_color(x+1, y+1, txt, 1, 1, rot, c, c, c, c, alpha);

c = c_white;
draw_text_transformed_color(x, y, txt, 1, 1, rot, c, c, c, c, alpha);