// --- 1. GRAVITY & INPUT ---
ysp += 0.1;

// We set horizontal speed to exactly 1 (as requested)
var _walk_speed = 1; 
var _move = keyboard_check(vk_right) - keyboard_check(vk_left);

xsp = _move * _walk_speed;

// --- 2. JUMPING ---
if (place_meeting(x, y + 1, oPlatform)) {
    ysp = 0;
    // Jump height set to -2 (as requested)
    if (keyboard_check_pressed(vk_space)) {
        ysp = -2;
    }
}

// Apply Movement
move_and_collide(xsp, ysp, oPlatform);

// --- 3. FLAG LOGIC ---
if (place_meeting(x, y, oFlag)) {
    global.flag_count += 1;
    x = xstart; 
    y = ystart;
    ysp = 0; 
    
    if (global.flag_count >= 10) {
        room_goto(rm_End);
    }
}

// --- 4. SPIKE LOGIC ---
if (place_meeting(x, y, oSpikes)) {
    x = xstart;
    y = ystart;
    ysp = 0;
}