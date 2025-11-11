package io.github.derec4.endToOverworld;

import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerMoveEvent;
import org.bukkit.plugin.java.JavaPlugin;

public final class EndToOverworld extends JavaPlugin implements Listener {

    private static final double END_VOID_Y = -40.0;
    private static final double OVERWORLD_SPAWN_Y = 340.0;

    @Override
    public void onEnable() {
        // Register event listener
        Bukkit.getPluginManager().registerEvents(this, this);
        getLogger().info("EndToOverworld plugin enabled! Players falling below Y=" + END_VOID_Y + " in the End will be teleported to the Overworld.");
    }

    @Override
    public void onDisable() {
        getLogger().info("EndToOverworld plugin disabled!");
    }

    @EventHandler
    public void onPlayerMove(PlayerMoveEvent event) {
        Player player = event.getPlayer();
        Location location = player.getLocation();

        // Check if player is in the End dimension
        if (location.getWorld().getEnvironment() != World.Environment.THE_END) {
            return;
        }

        // Check if player is below the void threshold
        if (location.getY() < END_VOID_Y) {
            teleportToOverworld(player, location);
        }
    }

    private void teleportToOverworld(Player player, Location endLocation) {
        // Get the overworld
        World overworld = Bukkit.getWorlds().stream()
                .filter(world -> world.getEnvironment() == World.Environment.NORMAL)
                .findFirst()
                .orElse(null);

        if (overworld == null) {
            getLogger().warning("Could not find overworld for player " + player.getName());
            return;
        }

        // Create new location in overworld at same X, Z coordinates but at Y=340
        Location targetLocation = new Location(
                overworld,
                endLocation.getX(),
                OVERWORLD_SPAWN_Y,
                endLocation.getZ(),
                endLocation.getYaw(),
                endLocation.getPitch()
        );

        // Teleport the player
        player.teleport(targetLocation);
    }
}
