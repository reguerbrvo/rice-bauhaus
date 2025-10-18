# rice-bauhaus — bspwm + polybar rice (snapshot)

**Status:** WIP / Prototype / Stable

## Overview
This repository contains my Arch Linux "Bauhaus" rice: bspwm, sxhkd, polybar, kitty, picom and small scripts. It documents the current state and the step-by-step process to reproduce the setup.

## Goals
- Minimal, geometric Bauhaus-inspired UI
- Reproducible config + install steps
- Clean history of incremental progress

## What's included
- `bspwm/` — bspwmrc, rules, autostart
- `sxhkd/` — keybindings
- `polybar/` — config + launch scripts
- `kitty/` — theme + kitty.conf
- `picom/` — picom.conf
- `docs/` — process notes, screenshots, roadmap

## How to use / install
1. Backup current configs: `cp -r ~/.config/{...} ~/dotfiles-backup/`
2. Clone repo: `git clone git@github.com:YOUR_USERNAME/rice-bauhaus.git`
3. Follow `docs/INSTALL.md` (TBD) for symlinks and autostart.

## Repo structure
Explain important files and where they should be symlinked.

## Roadmap / Phases
- Phase 0 — snapshot + documentation (this commit)
- Phase 1 — core bspwm + polybar baseline
- Phase 2 — styling & themes
- Phase 3 — polish, scripts, CI

## Contributing
Short notes: open issues, PRs, how to propose visual changes.

## License
MIT (or pick a license). See `LICENSE`.

## Contact
Your name / email / links
