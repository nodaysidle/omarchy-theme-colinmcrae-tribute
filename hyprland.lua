-- Colin McRae Tribute — Hyprland Configuration (Lua)
-- Tribute to Colin McRae MBE & Nicky Grist — 1997 Subaru Impreza WRC97 (P2 WRC)
--
-- Features:
--   - "Night Special Stage" laser sweep: stealth carbon base with focused 555 Yellow + Gold + STi Red beam
--   - Frosted motorsport glass with illuminated specular inner glow
--   - Superellipse continuous curvature window corners (power 4.5, rounding 18)
--   - Precision layer blurs for Waybar, Walker, and Notifications

-- ── "Night Special Stage" Laser Sweep Gradient ──
-- 75% stealth carbon, 25% concentrated high-intensity rally light beam
local active_border_color = {
  colors = {
    "rgba(070B14F5)", -- Deep Stealth Cockpit Carbon
    "rgba(0B162EF5)", -- Subtle SWRT Midnight Blue transition
    "rgba(1255CCEE)", -- SWRT Sonic Blue halo
    "rgba(D4AF37FF)", -- Speedline Magnesium Gold
    "rgba(FFF200FF)", -- 555 Pure Neon Laser Tip
    "rgba(FF0055FF)", -- STi Cherry Red trailing spark
    "rgba(0B162EF5)", -- Subtle SWRT Midnight Blue transition
    "rgba(070B14F5)", -- Deep Stealth Cockpit Carbon
  },
  angle = 45,
}

local inactive_border_color = {
  colors = {
    "rgba(070B1499)", -- Stealth Carbon
    "rgba(141D3066)", -- Muted SWRT Navy
    "rgba(070B1499)", -- Stealth Carbon
  },
  angle = 45,
}

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 6,
    gaps_out = 14,
    border_size = 4,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
      border_locked_active = active_border_color,
      border_locked_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(1255CC66)", -- Sonic Blue translucent tab
        inactive = "rgba(0B101D80)", -- Dark cockpit acrylic
      },
      text_color = "rgb(FFF200)", -- 555 Neon Yellow active tab title
      text_color_inactive = "rgba(F2F5F899)",
      blur = true,
      gradient_rounding = 10,
    },
  },

  decoration = {
    rounding = 18,
    rounding_power = 4.5, -- Superellipse smooth curvature

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    dim_inactive = true,
    dim_strength = 0.06,
    dim_special = 0.35,

    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      brightness = 1.16,
      contrast = 1.16,
      vibrancy = 0.82,
      vibrancy_darkness = 0.40,
      noise = 0.003,

      popups = true,
      popups_ignorealpha = 0.2,
      special = true,
      input_methods = true,
      input_methods_ignorealpha = 0.2,
      new_optimizations = true,
      ignore_opacity = true,
      xray = false,
    },

    -- ── Specular Inner Rim Light ──
    glow = {
      enabled = true,
      range = 14,
      render_power = 2,
      color = {
        colors = { "rgba(FFF20038)", "rgba(1255CC1F)" }, -- Neon Yellow into Sonic Blue sheen
        angle = 90,
      },
      color_inactive = {
        colors = { "rgba(1255CC14)", "rgba(00000000)" },
        angle = 90,
      },
    },

    shadow = {
      enabled = true,
      range = 18,
      render_power = 4,
      color = { colors = { "rgba(00000038)", "rgba(00000085)" }, angle = 90 },
      color_inactive = { colors = { "rgba(00000020)", "rgba(00000050)" }, angle = 90 },
      offset = { 0, 3 },
      scale = 0.95,
    },
  },
})

-- ── Laser Sweep Smooth Continuous Loop Animation ──
hl.animation({
  leaf = "borderangle",
  enabled = true,
  speed = 36, -- Crisp purposeful sweep (~5.5s per loop)
  bezier = "linear",
  style = "loop",
})

-- ── Motion Curves ──
hl.curve("glassSettle", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })
hl.curve("glassDismiss", { type = "bezier", points = { { 0.42, 0.0 }, { 1.0, 1.0 } } })

hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "glassSettle", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "glassDismiss", style = "fade" })

-- ── Window Translucency Rules ──
o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "1.0 1.0" })
o.window({ tag = "default-opacity" }, { opacity = "0.93 0.90" })
o.window({ tag = "chromium-based-browser" }, { opacity = "0.93 0.90" })
o.window({ tag = "firefox-based-browser" }, { opacity = "0.93 0.90" })

-- ── Layer Surface Blurs ──
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.04, blur_popups = true })
hl.layer_rule({ match = { namespace = "walker" }, blur = true, ignore_alpha = 0.35 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.06 })
hl.layer_rule({ match = { namespace = "swayosd" }, blur = true, ignore_alpha = 0.06 })
