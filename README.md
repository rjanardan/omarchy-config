# Omarchy Config

Backup of the Omarchy desktop configuration, replicable to any machine via git.

## What's here

```
configs/
  shell.json              # Bar layout & widgets (incl. dell-stock command widget)
  shell.toml              # Bar height / font / icon sizing
  bar/scripts/dell-stock  # NYSE: DELL stock widget script (Yahoo Finance)
  plugins/                # Custom user plugins: jana.agents, jana.bar, jana.clock, jana.menu
  hooks/                  # Automation hooks (battery-low, post-boot, post-update, theme-set, ...)
  defaults/               # agent, dictation
  extensions/omarchy-menu.jsonc
  branding/               # about.txt, screensaver.txt
  hypr/bindings.lua       # Hyprland keybindings (SUPER+LEFT/RIGHT workspace switching)
  omarchy.el              # Emacs Omarchy integration (font-set / theme-set hooks)
  terminals/              # alacritty, foot, kitty, ghostty, btop, starship, git configs
  themed/                 # Theme template samples
```

Sensitive / environment-specific data is **not** committed: `.bak.*` files, caches,
clipboard history, and runtime state under `~/.local/state/omarchy/` are excluded.

## Migrating to a new machine (Yoga / any fresh Omarchy install)

On the **new** machine, clone and copy configs into place, then restart Omarchy.

```bash
# 1. Config repo
git clone https://github.com/rjanardan/omarchy-config.git ~/github/omarchy-config
rsync -a ~/github/omarchy-config/configs/ ~/.config/omarchy/

# 2. Hyprland bindings + Emacs integration (live outside ~/.config/omarchy/)
cp ~/github/omarchy-config/configs/hypr/bindings.lua ~/.config/hypr/bindings.lua
cp ~/github/omarchy-config/configs/omarchy.el   ~/.config/emacs/omarchy.el

# 3. Terminal configs
# Alacritty
cp ~/github/omarchy-config/configs/terminals/alacritty.toml ~/.config/alacritty/alacritty.toml
# Foot
cp ~/github/omarchy-config/configs/terminals/foot.ini       ~/.config/foot/foot.ini
# Kitty
cp ~/github/omarchy-config/configs/terminals/kitty.conf     ~/.config/kitty/kitty.conf
# Ghostty
cp ~/github/omarchy-config/configs/terminals/ghostty.conf   ~/.config/ghostty/config
# btop, starship, git
cp ~/github/omarchy-config/configs/terminals/btop.conf      ~/.config/btop/btop.conf
cp ~/github/omarchy-config/configs/terminals/starship.toml  ~/.config/starship.toml
cp ~/github/omarchy-config/configs/terminals/git-config     ~/.config/git/config
```

Then apply:

```bash
omarchy restart shell          # bar / shell — picks up shell.json + plugins
omarchy restart terminal       # terminals
hyprctl reload                 # Hyprland keybindings
```

Notes

- `bar/scripts/dell-stock` is a thin copy; the canonical source is the
  `omarchy-apps` repo (`bar/scripts/dell-stock`). Keep the two in step when
  editing the widget.
- The shell.json `exec` for the dell-stock widget references
  `~/.config/omarchy/bar/scripts/dell-stock`, so after the rsync above the
  widget resolves the script from this repo's `configs/bar/scripts/dell-stock`.
- Omarchy themes still run through `~/.local/state/omarchy/current/theme/...`
  (generated at theme-change time) — no manual step needed.

## Hermes (agent) config, skills, and memory

These live in a separate repo (this one is desktop config only):

```bash
git clone https://github.com/rjanardan/hermes-files.git ~/github/hermes-files
# Then follow the sync/merge procedure in that repo's README / scripts/sync.sh
```

The omarchy custom plugins (`jana.bar`, `jana.agents`, `jana.clock`) hook into
Hermes agent usage at `~/.local/state/omarchy/agents/...`.