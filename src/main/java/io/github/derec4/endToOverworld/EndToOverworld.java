package io.github.derec4.endToOverworld;

import io.github.derec4.endToOverworld.listeners.EndVoidListener;
import org.bukkit.Bukkit;
import org.bukkit.plugin.java.JavaPlugin;

public final class EndToOverworld extends JavaPlugin {

    @Override
    public void onEnable() {
        // Inspiration from FunkyToc
        Bukkit.getPluginManager().registerEvents(new EndVoidListener(this), this);
    }

    @Override
    public void onDisable() {
        getLogger().info("EndToOverworld plugin disabled!");
    }
}
