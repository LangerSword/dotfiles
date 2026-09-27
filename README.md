# dotfiles

My Arch + Hyprland setup: the **[end-4](https://github.com/end-4/dots-hyprland) / illogical-impulse** shell family,
in its `end4-enhanced` fork. Mirrored out of `~/.config` (plus the two files worth keeping outside it), so a
directory here is the same directory there — copy it back and you are done.

## what is in here

| here | goes to | what it is |
|---|---|---|
| `hypr/` | `~/.config/hypr` | the compositor: `hyprland.lua` + `hyprland/*.lua`, keybinds, rules, execs, env, monitors, workspaces, hyprlock, hypridle |
| `illogical-impulse/` | `~/.config/illogical-impulse` | the shell's settings — `config.json` (mine) and `installed_listfile` |
| `quickshell/end4-enhanced/` | `~/.config/quickshell/end4-enhanced` | **only the file I have changed locally** — see below |
| `fish/` | `~/.config/fish` | shell: starship prompt, transience, aliases |
| `kitty/` | `~/.config/kitty` | terminal, and its two Python kittens |
| `fastfetch/` | `~/.config/fastfetch` | the fetch, with the gifs it shows |
| `starship.toml` | `~/.config/starship.toml` | the prompt |
| `zshrc.d/` | `~/.config/zshrc.d` | the zsh drop-ins |
| `home/.bashrc` | `~/.bashrc` | the one bash file that matters |
| `home/.gitconfig` | `~/.gitconfig` | name, email, and `gh` as the credential helper (no token in it) |

## the shell is upstream's, with one local patch

The shell tree at `~/.config/quickshell/end4-enhanced` is a **git clone** of
[`rubberpirate/end4-enhanced`](https://github.com/rubberpirate/end4-enhanced), pinned at **`c152c2d`**. It is not
duplicated here: 51MB of git history and ~20MB of vendored fonts and screenshots are not dotfiles. What *is* here
is the single file I actually edited —

`quickshell/end4-enhanced/modules/ii/background/widgets/ducky/DuckyWidget.qml`

whose card reads `you though you could do this huh? — Lakshaya` instead of upstream's text.

**Restoring it:**

```bash
git clone https://github.com/rubberpirate/end4-enhanced ~/.config/quickshell/end4-enhanced
cd ~/.config/quickshell/end4-enhanced && git checkout c152c2d
cp <this-repo>/quickshell/end4-enhanced/modules/ii/background/widgets/ducky/DuckyWidget.qml \
   modules/ii/background/widgets/ducky/
```

**Restoring the config:**

```bash
git clone https://github.com/LangerSword/dotfiles /tmp/dots
cp -r /tmp/dots/{hypr,illogical-impulse,kitty,fish,fastfetch,zshrc.d} ~/.config/
cp /tmp/dots/starship.toml ~/.config/
cp /tmp/dots/home/.bashrc /tmp/dots/home/.gitconfig ~/
```

The shell reads its settings from `illogical-impulse/config.json`; which shell is live is declared in
`hypr/hyprland/variables.lua` — `hl.env("qsConfig", "end4-enhanced")`.

## what is deliberately not here

- **the shell's own tree** — upstream's clone, as above. Re-clone it rather than carry it.
- **`~/.config/quickshell/ii/`** — the older end-4 shell, superseded by `end4-enhanced`.
- **litter** — `*.bak`, `*.old`, `*.new`, `fastfetch/dump.sql`, and the stray nested `fastfetch/fastfetch/` copy.
- **anything holding a key.** `.gitconfig` uses `gh` as the credential helper, and the shell's API keys live in
  the **keyring** (`secret-tool`), not in these files. One upstream file is worth naming so nobody copies it by
  accident: `end4-enhanced/config/fish/config.fish` ships an `ANTHROPIC_API_KEY` shim pointing at a local proxy —
  upstream's example, not mine.

Public repo: take whatever is useful. If something here breaks your machine, that is on your machine, not on mine.
