package io.github.derec4.endToOverworld.listeners;

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
    private static final double END_VOID_Y = -40.0;

    public EndVoidListener(JavaPlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onPlayerMove(PlayerMoveEvent event) {
        Player player = event.getPlayer();
        Location loc = player.getLocation();
        World world = loc.getWorld();
        if (world == null) {
            return;
        }

        // Only handle players in the End
        if (world.getEnvironment() != World.Environment.THE_END) {
            return;
        }

        // Teleport if below threshold
        if (loc.getY() < END_VOID_Y) {
            PlayerUtils.teleportToOverworld(plugin, player, loc);
        }
    }
}

