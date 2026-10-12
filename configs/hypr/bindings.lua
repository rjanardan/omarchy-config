-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Disable the stale packaged-app entry so the launcher only shows the real Hermes.
-- (The system /usr/share/applications/hermes-desktop.desktop runs the Omarchy-hermes-desktop
-- wrapper via /usr/bin/hermes-desktop, which loses your local git runtime; the real entry is
-- ~/.local/share/applications/com.nousresearch.hermes.desktop → /home/jana/.local/bin/hermes desktop --skip-build)
hl.unbind("SUPER + SHIFT + H")  -- avoid duplicate if you re-run this
o.bind("SUPER + SHIFT + H", "Hermes", "omarchy-launch-or-focus Hermes '/home/jana/.local/bin/hermes desktop --skip-build'")

-- Map Super+Left/Right to switch workspaces (previously "focus left/right window")
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
o.bind("SUPER + LEFT", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + RIGHT", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
