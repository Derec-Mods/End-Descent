package io.github.derec4.endToOverworld.listeners;

import io.github.derec4.endToOverworld.utils.ConfigManager;
import io.github.derec4.endToOverworld.utils.PlayerUtils;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerMoveEvent;
import org.bukkit.plugin.java.JavaPlugin;

/**
 * Inspiration from FunkyToc
 */
public class EndVoidListener implements Listener {
    private final JavaPlugin plugin;

    public EndVoidListener(JavaPlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onPlayerMove(PlayerMoveEvent event) {
        // Debug: event entry
        plugin.getLogger().info("[DEBUG] EndVoidListener.onPlayerMove called for player=" + event.getPlayer().getName());

        // Check if End to Overworld teleportation is enabled
        if (!ConfigManager.isEndToOverworldEnabled()) {
            plugin.getLogger().info("[DEBUG] End->Overworld is disabled in config. Skipping.");
            return;
        }

        Player player = event.getPlayer();
        Location loc = player.getLocation();
        World world = loc.getWorld();

        if (world == null) {
            plugin.getLogger().info("[DEBUG] Player world is null for player=" + player.getName());
            return;
        }

        plugin.getLogger().info("[DEBUG] Player=" + player.getName() + " in world=" + world.getName() + " env=" + world.getEnvironment() + " y=" + loc.getY());

        if (world.getEnvironment() != World.Environment.THE_END) {
            plugin.getLogger().info("[DEBUG] Player is not in THE_END. Skipping.");
            return;
        }

        // Use configurable end limit threshold
        double endLimit = ConfigManager.getEndLimit();
        double playerY = loc.getY();
        plugin.getLogger().info("[DEBUG] Checking end limit: playerY=" + playerY + " endLimit=" + endLimit);

        if (playerY < endLimit) {
            plugin.getLogger().info("[DEBUG] Player went below end limit, teleporting to Overworld: player=" + player.getName());
            PlayerUtils.teleportToOverworld(plugin, player, loc);
        } else {
            plugin.getLogger().info("[DEBUG] Player Y is above limit, no teleport. playerY=" + playerY + " endLimit=" + endLimit);
        }
    }
}
