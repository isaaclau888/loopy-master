var _mw = display_get_gui_width() / 2;
var _mh = display_get_gui_height() / 2;

// 1. DYNAMIC BACKGROUND
// This creates a dark purple that subtly pulses
var _bg_pulse = abs(sin(timer * 0.02)) * 20;
draw_clear(make_color_rgb(20 + _bg_pulse, 0, 40 + _bg_pulse)); 

// 2. RAINBOW TEXT EFFECT
// make_color_hsv(hue, saturation, value) - 255 is the max for each
var _hue = (timer * 2) % 255; 
var _rainbow_color = make_color_hsv(_hue, 200, 255);

draw_set_halign(fa_center);
draw_set_color(_rainbow_color);
draw_text_transformed(_mw, _mh - 80, "VICTORY!", 5, 5, sin(timer * 0.05) * 5);

// 3. DRAW CONFETTI (Code-based)
for (var i = 0; i < 20; i++) {
    var _cx = (i * 100 + (timer * 2)) % 1280;
    var _cy = (i * 50 + (timer * 5)) % 720;
    draw_set_color(make_color_hsv((i * 20) % 255, 200, 255));
    draw_rectangle(_cx, _cy, _cx + 10, _cy + 10, false);
}

// 4. SUBTITLE & RETURN PROMPT
draw_set_color(c_white);
draw_text_transformed(_mw, _mh + 40, "YOU ARE THE LOOPY MASTER", 2, 2, 0);

var _alpha = abs(sin(timer * 0.05)); // Make the prompt blink
draw_set_alpha(_alpha);
draw_set_color(c_yellow);
draw_text_transformed(_mw, _mh + 150, "PRESS ENTER TO PLAY AGAIN", 1.5, 1.5, 0);
draw_set_alpha(1); // Reset alpha so other things don't go invisible

// 5. INPUT TO RETURN
if (keyboard_check_pressed(vk_enter)) {
    room_goto(rm_Menu);
}