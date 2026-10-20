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

## ⚡ The "Night Special Stage" Laser Sweep Borders

Unlike static window borders, Colin McRae Tribute features a 4px illuminated laser sweep: 75% stealth cockpit carbon frame that melts into your wallpaper, with a high-intensity 25% beam of SWRT Sonic Blue, Speedline Magnesium Gold, 555 Neon Yellow, and STi Cherry Red sweeping around active windows:

```lua
active_border = {
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
```

* **Animation:** One sweep on `borderangle` each time a window takes focus (`style = "once"`). A looping sweep redraws every frame forever and keeps integrated GPUs awake, so the beam only fires when you change windows.
* **Border Size:** `4px` illuminated beam for maximum presence against frosted dark glass.
* **Inactive Windows:** Muted stealth carbon weave with faint navy transition (`rgba(070B1499)`).

---

## 🏎️ Bar Widgets & Custom Plugins

Included directly in the theme repository:

1. **`colinmcrae.wrc-badge`**: Centered tribute badge featuring the authentic **P2 WRC Subaru World Rally Team crescent emblem** (with 3D cyan extrusion) alongside 555 insignia and STi red racing tab. Left-click fires Colin's iconic *"If in doubt, flat out"* notification.
2. **`colinmcrae.workspaces`**: Clean, borderless workspace switcher with native optical alignment:
   - **Active:** Gleaming **Speedline Gold (`#D4AF37`)**, labelled as a stage (`SS3`)
   - **Occupied:** Warm **Muted Gold (`#C5A059`)**
   - **Unused:** Soft **SWRT Rally Blue (`#3B6DB5`)**
3. **`colinmcrae.stage-hud`**: Rally HUD for the bar. Uptime shows as stage time (`SS 03:42`), CPU package temperature as water temp in 555 yellow, turning STi Cherry Red at 85°C. Click the stage time for a pace note. Polls once every 30 s.
4. **Hyprland:** Superellipse continuous-curvature corners (`rounding = 18`, `power = 4.5`), specular inner rim reflection (`glow` with gold/sonic tint), and 2-pass high-vibrancy backdrop blur. Notifications, OSD and reminders get the frosted blur.
5. **Foot:** 92% translucent midnight blue background with blur, Subaru WRC ANSI palette, and a 555 yellow block cursor.
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
