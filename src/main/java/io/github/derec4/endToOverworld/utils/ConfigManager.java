package io.github.derec4.endToOverworld.utils;

import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.plugin.java.JavaPlugin;

public final class ConfigManager {
    private static boolean endToOverworldEnabled;
    private static double endLimit;
    private static int overSpawnYPos;
    private static boolean overworldToEndEnabled;
    private static double overLimit;
    private static int endSpawnYPos;
    private static boolean visitEndFirst;
    private static boolean showParticles;
    private static boolean affectEntities;
    private static String fallbackWorld;

    public static void loadConfig(JavaPlugin plugin) {
        plugin.saveDefaultConfig();

        FileConfiguration config = plugin.getConfig();

        // Load End to Overworld settings
        endToOverworldEnabled = config.getBoolean("end-to-overworld.enabled", true);
        endLimit = config.getDouble("end-to-overworld.end-limit", -40.0);
        overSpawnYPos = config.getInt("end-to-overworld.over-spawn-y-pos", 340);

        // Load Overworld to End settings
//        overworldToEndEnabled = config.getBoolean("overworld-to-end.enabled", false);
//        overLimit = config.getDouble("overworld-to-end.over-limit", 360.0);
        endSpawnYPos = config.getInt("overworld-to-end.end-spawn-y-pos", -10);
        visitEndFirst = config.getBoolean("overworld-to-end.visit-end-first", false);
        showParticles = config.getBoolean("particles.enabled", true);
        affectEntities = config.getBoolean("entities.affect-entities", false);
        fallbackWorld = config.getString("fallback.world", "auto");

        plugin.getLogger().info("Configuration loaded:");
        plugin.getLogger().info("  End→Overworld: " + (endToOverworldEnabled ? "enabled" : "disabled") + " (threshold: " + endLimit + ")");
        plugin.getLogger().info("  Particles: " + (showParticles ? "enabled" : "disabled"));
    }

    /**
     * Reload configuration from disk.
     */
    public static void reloadConfig(JavaPlugin plugin) {
        plugin.reloadConfig();
        loadConfig(plugin);
    }

    public static boolean isEndToOverworldEnabled() {
        return endToOverworldEnabled;
    }

    public static double getEndLimit() {
        return endLimit;
    }

    public static int getOverSpawnYPos() {
        return overSpawnYPos;
    }

    public static boolean isOverworldToEndEnabled() {
        return overworldToEndEnabled;
    }

    public static double getOverLimit() {
        return overLimit;
    }

    public static int getEndSpawnYPos() {
        return endSpawnYPos;
    }

    public static boolean isVisitEndFirst() {
        return visitEndFirst;
    }

    public static boolean isShowParticles() {
        return showParticles;
    }

    public static boolean isAffectEntities() {
        return affectEntities;
    }

    public static String getFallbackWorld() {
        return fallbackWorld;
    }
}

