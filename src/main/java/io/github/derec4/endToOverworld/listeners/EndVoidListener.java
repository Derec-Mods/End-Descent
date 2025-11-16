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
        // Check if End to Overworld teleportation is enabled
        if (!ConfigManager.isEndToOverworldEnabled()) {
            return;
        }

        Player player = event.getPlayer();
        Location loc = player.getLocation();
        World world = loc.getWorld();

        if (world == null) {
            return;
        }

        if (world.getEnvironment() != World.Environment.THE_END) {
            return;
        }

        // Use configurable end limit threshold
        double endLimit = ConfigManager.getEndLimit();
        double playerY = loc.getY();

        if (playerY < endLimit) {
            PlayerUtils.teleportToOverworld(plugin, player, loc);
        }
    }
}
