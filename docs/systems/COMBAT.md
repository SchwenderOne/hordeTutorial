# Systems — COMBAT

## Current loop
- **Player**: Soldier character (CharacterBody2D) under direct movement control via WASD-style input (`move_left/right/up/down`). Speed currently `600 px/s`.
- **Weapon**: `Gun` scene is attached to the player anchor point. It uses an `Area2D` overlap check to find enemies within a ~1000px radius, rotates via `look_at`, and fires bullets from `%ShootingPoint` when overlapping enemies are present.
- **Enemies**: `Mob` instances (Orc) continuously move toward the player (`direction_to` + `move_and_slide`). Base speed randomised per spawn between 200–300 px/s and health = 3.
- **Damage model**:
  - Player health = 100. While overlapping mobs, damage is applied at `6 HP/sec * mob_count` and updates the HUD health bar.
  - Enemies take discrete damage from bullets (`mob.gd::take_damage`). On 3 hits they spawn a smoke effect and free themselves.
- **Feedback**: Animations handled via `AnimatedSprite2D` on both Soldier (idle/walk) and Orc (idle/walk/hurt). Player health bar now lives in `/root/Game/HUD` (CanvasLayer) so it stays screen-space.

## Known gaps / next steps
- No melee knockback or contact VFX yet (just health ticks).
- Gun auto-fire cadence is tied to overlaps; tighten with explicit fire rate and muzzle flash.
- Need enemy attack telegraphing and player hurt feedback (sound, tint, screenshake).
- Balance pass: current DPS values are placeholders—document target TTK once tuning begins.
