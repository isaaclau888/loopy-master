var _mw = display_get_gui_width() / 2;
var _mh = display_get_gui_height() / 2;

// 1. BACKGROUND (Dark "Campfire" Purple)
draw_clear(make_color_rgb(30, 10, 50)); 

draw_set_halign(fa_center);

if (!show_help) {
    // 2. ANIMATED TITLE
    // Makes the title pulse and change color
    var _pulse = 1 + sin(timer * 0.05) * 0.1;
    var _title_col = merge_color(c_aqua, c_lime, abs(sin(timer * 0.03)));
    
    draw_set_color(_title_col);
    draw_text_transformed(_mw, _mh - 150, "LOOPY MASTER", 4 * _pulse, 4 * _pulse, 0);
    
    // 3. MENU OPTIONS
    for (var i = 0; i < array_length(menu_options); i++) {
        if (index == i) {
            draw_set_color(c_yellow);
            
            // Draw a "Flag" (Represented by a triangle and a line)
            // It bounces slightly to the left and right of the selected text
            var _bx = 180 + sin(timer * 0.1) * 10;
            draw_line_width(_mw - _bx, _mh + (i * 60) - 10, _mw - _bx, _mh + (i * 60) + 30, 4); // Flagpole
            draw_triangle(_mw - _bx, _mh + (i * 60) - 10, _mw - _bx + 20, _mh + (i * 60), _mw - _bx, _mh + (i * 60) + 10, false); // Flag
            
            draw_text_transformed(_mw, _mh + (i * 60), menu_options[i], 2.2, 2.2, 0);
        } else {
            draw_set_color(c_white);
            draw_text_transformed(_mw, _mh + (i * 60), menu_options[i], 2, 2, 0);
        }
    }
} else {
    // 4. HELP SCREEN
    draw_set_color(c_lime);
    draw_text_transformed(_mw, _mh - 100, "LOOPY RULES", 3, 3, 0);
    
    draw_set_color(c_white);
    draw_text_transformed(_mw, _mh - 10, "1. Reach the Flag 10 times", 1.5, 1.5, 0);
    draw_text_transformed(_mw, _mh + 30, "2. Avoid the Red Spikes", 1.5, 1.5, 0);
    draw_text_transformed(_mw, _mh + 70, "Arrows to move | Space to jump", 1.2, 1.2, 0);
    
    draw_set_color(c_aqua);
    draw_text_transformed(_mw, _mh + 150, "PRESS ANY KEY TO BACK", 1, 1, 0);
}