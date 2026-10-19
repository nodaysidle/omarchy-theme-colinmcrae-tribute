# Colin McRae Tribute — Omarchy Theme Plugin 🏁

> *"If in doubt, flat out."* — Colin McRae MBE (1968–2007)

A tribute theme for **Omarchy** celebrating the legendary **Colin McRae** and co-driver **Nicky Grist**, styled directly after the iconic **1997 Subaru Impreza WRC97 chassis #001 (`P2 WRC`)** from the Monte Carlo Rally.

Built with dark frosted motorsport glass, superellipse geometry, and **"The 555 Comet"** continuous rotating border livery.

---

## 🎨 Color Palette & Livery DNA

Extracted directly from high-resolution studio and stage photography of `P2 WRC`:

| Token | Hex | Role & Motorsport Origin |
| :--- | :--- | :--- |
| **World Rally Blue** | `#1255CC` | Metallic Sonic Mica Blue exterior body panels & wing |
| **555 Neon Swirl** | `#FFF200` | State Express 555 crescent graphics & Pirelli bumper decals |
| **Speedline Gold** | `#D4AF37` | 6-spoke Speedline magnesium rally wheels |
| **STi Cherry Red** | `#FF0055` | STi fog cover badges & cockpit toggle circuit-breaker switches |
| **Deep Blue Acrylic** | `#0B101D` | Frosted motorsport window tint |
| **Cockpit Carbon** | `#070B14` | Textured carbon-fiber center console & MOMO suede black |
| **Monte Carlo White**| `#F2F5F8` | Crisp rally stage number plates & windshield lettering |

---

## ⚡ The "555 Comet" Moving Borders

Unlike static window borders, Colin McRae Tribute features a multi-stop rotating gradient that sweeps around active windows at a smooth, continuous velocity:

```lua
active_border = {
  colors = {
    "rgba(0A2A66F2)", -- Deep World Rally Blue
    "rgba(1255CCF2)", -- Electric Sonic Blue
    "rgba(FFF200F2)", -- 555 Neon Yellow Comet Tip
    "rgba(D4AF37F2)", -- Speedline Magnesium Gold
    "rgba(FF0055F2)", -- STi Cherry Flash
    "rgba(1255CCF2)", -- Electric Sonic Blue
    "rgba(0A2A66F2)", -- Deep World Rally Blue
  },
  angle = 45,
}
```

* **Animation:** Loop animation on `borderangle` (`speed = 50`) creating a continuous 555 comet effect.
* **Inactive Windows:** Muted carbon weave with faint Speedline Gold corner reflections (`rgba(D4AF3733)`).

---

## 🏎️ Surface Design & Frosted Glass

1. **Hyprland:** Superellipse continuous-curvature corners (`rounding = 18`, `power = 4.5`), specular inner rim reflection (`glow` with gold/sonic tint), and 3-pass high-vibrancy backdrop blur.
2. **Waybar:** Floating pill with deep Sonic Blue translucent gradient, Speedline Gold hairline edge, and glowing 555 Neon Yellow active workspace indicator.
3. **Ghostty & Terminals:** 84% translucent midnight blue background with 20px blur, vibrant Subaru WRC ANSI palette, and a 555 yellow block cursor.
4. **Walker Launcher:** Glass acrylic panel with gold bevel, recessed search well, and glowing neon yellow selection.
5. **Mako Notifications & SwayOSD:** Frosted popups with Speedline Gold borders and yellow progress indicators (`[urgency=high]` fires with STi Cherry Red).
6. **Btop:** Transparent terminal passthrough styled after MoTeC rally telemetry.

---

## 🖼️ Included Wallpapers

The `backgrounds/` folder contains curated wallpapers of `P2 WRC`:

1. `1-mcrae-panning.jpg` — High-speed sideways motion-blur panning shot (Default)
2. `2-mcrae-forest.jpg` — Forest road beauty stance
3. `3-mcrae-front.jpg` — Aggressive front 3/4 with yellow bonnet crescent
4. `4-mcrae-rear.jpg` — Famous high rear wing, mudflaps, and P2 WRC plate
5. `5-mcrae-engine.jpg` — Engine bay with twin-scroll turbo and gold canisters
6. `6-mcrae-cockpit.jpg` — Carbon switchboard with "PULL FOR HOT" knob (Lockscreen)
7. `7-mcrae-wing.jpg` — Macro detail of the rally rear wing and sponsor decals

---

## 🚀 Installation & Activation

Run the bootstrap installer:

```bash
cd /home/arch/dev/nodaysidle/omarchy-theme-colinmcrae-tribute
./install
```

Then switch themes using Omarchy's theme switcher:

```bash
omarchy-theme-set colinmcrae-tribute
```

### Uninstallation

To remove the hook and revert local configs:

```bash
cd /home/arch/dev/nodaysidle/omarchy-theme-colinmcrae-tribute
./uninstall
```
