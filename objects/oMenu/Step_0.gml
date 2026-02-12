timer++; 

if (!show_help) {
    if (keyboard_check_pressed(vk_up)) index--;
    if (keyboard_check_pressed(vk_down)) index++;
    index = (index + array_length(menu_options)) % array_length(menu_options);

    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        if (index == 0) room_goto(Room1);
        if (index == 1) show_help = true;
        if (index == 2) game_end();
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) show_help = false;
}