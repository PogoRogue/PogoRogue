/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

// Check if the chest has transformed into a monster
if (has_transformed) {
    // Set damage, defenses, and drawing HP bar when transformed
    damage = 8;
    stomp_defense = 1;
    bullet_defense = 1;
    draw_hp = true;
    is_shaking = false;
    // Reset the alarm for transforming back if not already set
    if (alarm[1] < 0) {
        alarm_set(1, 30 * room_speed); // Set to transform back after 30 seconds
    }
} else {
    // Set properties when in chest form
    damage = 0;
    stomp_defense = 0;
    bullet_defense = 0;
    draw_hp = false;
    // Set an alarm for potentially starting to shake
    if (alarm[2] < 0) {
        alarm_set(2, 3 * room_speed); // Set to possibly start shaking after 3 seconds
    }
}

/// @description collisions and open states

// Handling collision with the player, similar to a normal chest
with (obj_player) {
    // Check for collision from above or standing on the chest
    if ((place_meeting(x, y + vspeed, other) && !place_meeting(x, y - 1, other) && vspeed > 0) ||
        (place_meeting(x, y + 1, other) && !place_meeting(x, y - 1, other) && vspeed == 0)) {
        // If the chest is not already open, open it and bounce the player
        if (other.open == false) {
            other.image_index = 1;
            other.colliding = true;
            vspeed = -10; // Bounce the player
        }
    } else if (other.colliding && other.open == false) {
        // Open the chest if conditions are met
        other.open = true;
    }
}

// Handling the chest opening
if (open) {
    // Check if the animation has reached the end
    if (image_speed > 0 && image_index >= sprite_get_number(sprite_index) - 1) {
        image_speed = 0; // Stop the animation
        sprite_index = spr_jack_in_the_box; // Change to the final sprite
        has_transformed = true; // Mark the transformation as complete
    } else {
        image_speed = 1; // Ensure the animation plays forward
    }
}

// Handling the transformation back to chest
if (transback) {
    has_transformed = false; // Mark as not transformed
    other.open = false; // Close the chest
    other.colliding = false; // Reset collision status
    sprite_index = spr_treasurechest_new; // Change back to the chest sprite
    image_speed = 0; // Stop any animation
    transback = false; // Reset the transformation flag
}
