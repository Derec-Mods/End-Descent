package io.github.derec4.endToOverworld.utils;

import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitRunnable;

public final class ParticleUtils {

    /**
     * Inspiration from FunkyToc
     * Play the End->Overworld transition particles and teleport the player to target after delayTicks.
     */
    public static void playTransitionAndTeleport(JavaPlugin plugin, Player player, Location target, long delayTicks) {
        final boolean showParticles = ConfigManager.isShowParticles();

        final BukkitRunnable cloudRepeater;

        if (showParticles) {
            cloudRepeater = new BukkitRunnable() {
                @Override
                public void run() {
                    if (!player.isOnline()) {
                        cancel();
                        return;
                    }
                    Location loc = player.getLocation();
                    // small cloud like the datapack: ~0.1 Y, count 1, tiny speed
                    player.getWorld().spawnParticle(Particle.CLOUD, loc.add(0, 0.1, 0), 1, 0, 0, 0, 0.001);
                }
            };

            // Start repeating immediately every tick
            cloudRepeater.runTaskTimer(plugin, 0L, 1L);
        } else {
            cloudRepeater = null;
        }

        // After delayTicks, stop repeating, spawn burst particles, and teleport
        new BukkitRunnable() {
            @Override
            public void run() {
                // stop the repeating small cloud
                if (cloudRepeater != null) {
                    cloudRepeater.cancel();
                }

                if (!player.isOnline()) {
                    return;
                }

                if (showParticles) {
                    Location loc = player.getLocation();
                    player.getWorld().spawnParticle(Particle.CRIT, loc.add(0, 0.5, 0), 10, 0.3, 0.3, 0.3, 0.001);
                    player.getWorld().spawnParticle(Particle.CLOUD, loc, 80, 0.8, 0.8, 0.8, 0.001);

                    if (target.getWorld() != null) {
                        Location targetLoc = target.clone().add(0, 0.5, 0);
                        target.getWorld().spawnParticle(Particle.CRIT, targetLoc, 10, 0.3, 0.3, 0.3, 0.001);
                        target.getWorld().spawnParticle(Particle.CLOUD, targetLoc, 80, 0.8, 0.8, 0.8, 0.001);
                    }
                }

                if (!player.isOnline()) {
                    return;
                }

                player.teleport(target);
            }
        }.runTaskLater(plugin, delayTicks);
    }

    /**
     * Convenience overload that uses 60 ticks (3 seconds) delay like the datapack.
     */
    public static void playTransitionAndTeleport(JavaPlugin plugin, Player player, Location target) {
        playTransitionAndTeleport(plugin, player, target, 60L);
    }
}

