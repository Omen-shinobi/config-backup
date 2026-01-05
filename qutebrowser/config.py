config.load_autoconfig()
# Force webpages to use a dark theme
config.set("colors.webpage.darkmode.enabled", True)

# Tell websites you prefer dark color schemes (for sites with native support)
config.set("colors.webpage.preferred_color_scheme", "dark")

# Use the 'smart' algorithm for the best look on NVIDIA 590
# Options: 'lightness-hsl', 'lightness-cielab', 'rgb'
config.set("colors.webpage.darkmode.algorithm", "lightness-hsl")

# High contrast for the Abyss theme vibe
config.set("colors.webpage.darkmode.contrast", 0.0)
# Spoof a modern Firefox user agent specifically for Google login
config.set('content.headers.user_agent', 'Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0', 'https://accounts.google.com/*')
# Set JetBrains Mono Nerd Font for all web content
c.fonts.web.family.standard = "JetBrainsMono Nerd Font"
c.fonts.web.family.sans_serif = "JetBrainsMono Nerd Font"
c.fonts.web.family.fixed = "JetBrainsMono Nerd Font"
c.fonts.web.family.serif = "JetBrainsMono Nerd Font"
