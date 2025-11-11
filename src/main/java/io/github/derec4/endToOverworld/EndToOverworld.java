package io.github.derec4.endToOverworld;

import io.github.derec4.endToOverworld.listeners.EndVoidListener;
import io.github.derec4.endToOverworld.utils.ConfigManager;
import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.plugin.java.JavaPlugin;

public final class EndToOverworld extends JavaPlugin {

    @Override
    public void onEnable() {
        ConfigManager.loadConfig(this);

        // Inspiration from FunkyToc
        Bukkit.getPluginManager().registerEvents(new EndVoidListener(this), this);

        Bukkit.getLogger().info("");
        Bukkit.getServer().getConsoleSender().sendMessage(ChatColor.GREEN + "  |_______|                             " +
                "  ");
        Bukkit.getServer().getConsoleSender().sendMessage(ChatColor.GREEN + "  | Derex |     End to Overworld v" + getDescription().getVersion());
        Bukkit.getServer().getConsoleSender().sendMessage(ChatColor.GREEN + "  |_______|     Inspiration from FunkyToc");
        Bukkit.getServer().getConsoleSender().sendMessage(ChatColor.GREEN + "  |_______|     Running on " + Bukkit.getName() + " - " + Bukkit.getVersion());
        Bukkit.getLogger().info("");
    }

    @Override
    public void onDisable() {
        getLogger().info("EndToOverworld plugin disabled!");
    }
}
