package io.github.derec4.endToOverworld.utils;

import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

public final class PlayerUtils {

    // Teleport the player from the End to the Overworld safely.
    public static void teleportToOverworld(JavaPlugin plugin, Player player, Location from) {
        World overworld = null;

        // Check if a specific fallback world is configured
        String fallbackWorldName = ConfigManager.getFallbackWorld();
        if (fallbackWorldName != null && !fallbackWorldName.equalsIgnoreCase("auto")) {
            overworld = Bukkit.getWorld(fallbackWorldName);
            if (overworld != null) {
                plugin.getLogger().info("Using configured fallback world: " + overworld.getName());
            }
        }

        // If no specific world configured or world not found, find the first NORMAL world
        if (overworld == null) {
            overworld = Bukkit.getWorlds().stream()
                    .filter(w -> w.getEnvironment() == World.Environment.NORMAL)
                    .findFirst()
                    .orElse(null);
        }

        if (overworld == null) {
            plugin.getLogger().warning("No Overworld found to teleport player from End. Falling back to the first loaded world.");
            if (Bukkit.getWorlds().isEmpty()) {
                plugin.getLogger().warning("No worlds available to teleport player.");
                return;
            }

            // Use the first loaded world as a safe fallback destination
            overworld = Bukkit.getWorlds().get(0);
            plugin.getLogger().info("Falling back to world: " + overworld.getName());
        }

        // Determine safe spawn: use player's X,Z coordinates
        double x = from.getX();
        double z = from.getZ();

        // Check if a specific spawn Y position is configured
        int overSpawnYPos = ConfigManager.getOverSpawnYPos();
        int safeY;

        if (overSpawnYPos <= 0) {
            // Use highest block Y at that column + 1
            safeY = overworld.getHighestBlockYAt((int) Math.floor(x), (int) Math.floor(z)) + 1;
        } else {
            // Use configured spawn Y position
            safeY = overSpawnYPos;
        }

        Location target = new Location(overworld, x, safeY, z, from.getYaw(), from.getPitch());

        // Delegate particle effects and teleport to ParticleUtils
        ParticleUtils.playTransitionAndTeleport(plugin, player, target);
    }
}
