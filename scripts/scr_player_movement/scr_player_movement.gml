function scr_player_movement(){
// PLAYER MOVEMENT SCRIPT FOR CHRONEXUS

// Create a script for handling movement logic
// This will make it easier to modify and reuse

// PLAYER VARIABLES
if (!variable_global_exists("player_speed")) global.player_speed = 4;
if (!variable_global_exists("player_jump_speed")) global.player_jump_speed = -8;
if (!variable_global_exists("player_roll_speed")) global.player_roll_speed = 6;
if (!variable_global_exists("player_roll_cooldown")) global.player_roll_cooldown = 30; // Frames before rolling again

// PLAYER STATE VARIABLES
if (!variable_global_exists("is_rolling")) global.is_rolling = false;
if (!variable_global_exists("roll_timer")) global.roll_timer = 0;

// KEYBOARD & INPUT HANDLING
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
if (keyboard_check(ord('D'))) move_x = 1;
if (keyboard_check(ord('A'))) move_x = -1;

var jump = keyboard_check_pressed(vk_space);
var roll = keyboard_check_pressed(vk_shift);

// HANDLE ROLL MECHANIC
if (roll && !global.is_rolling && global.roll_timer <= 0) {
    global.is_rolling = true;https://github.com/TheGiddyMeister/CHRONOEXUS-CHATGPT
    global.roll_timer = global.player_roll_cooldown;
    // Add movement boost
    x += global.player_roll_speed * move_x;
}

// HANDLE ROLL TIMER
if (global.is_rolling) {
    global.roll_timer--;
    if (global.roll_timer <= 0) {
        global.is_rolling = false;
    }
}

// HANDLE MOVEMENT
x += move_x * global.player_speed;

// HANDLE JUMPING
if (jump) {
    y += global.player_jump_speed;
}

// HANDLE COLLISION (PLACEHOLDER)
// Replace with tile-based collision logic
if (place_meeting(x, y+1, o_Solid)) {
    y -= 1;
}

}