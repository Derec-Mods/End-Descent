package io.github.derec4.endToOverworld;

import io.github.derec4.endToOverworld.listeners.EndVoidListener;
import org.bukkit.Bukkit;
import org.bukkit.plugin.java.JavaPlugin;

public final class EndToOverworld extends JavaPlugin {

    @Override
    public void onEnable() {
        // Register the listener which contains the End -> Overworld logic
        Bukkit.getPluginManager().registerEvents(new EndVoidListener(this), this);
        getLogger().info("EndToOverworld plugin enabled! Players falling in the End void will be teleported to the Overworld.");
    }

    @Override
    public void onDisable() {
        getLogger().info("EndToOverworld plugin disabled!");
    }
}
