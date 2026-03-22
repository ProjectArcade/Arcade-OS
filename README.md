# Arcade-OS

> A lightweight, fast, and beautifully customized Linux distribution built on Arch Linux — designed to run smoothly on low-end hardware while delivering a modern desktop experience.

[![Arch Linux](https://img.shields.io/badge/based%20on-Arch%20Linux-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org)
[![License](https://img.shields.io/badge/license-GPL--v2-blue)](LICENSE)
[![Status](https://img.shields.io/badge/status-alpha-orange)]()

---

> ⚠️ THIS README AND REPO IS STILL IN DEVELOPMENT (KINDLY DOWNLOAD THE STABLE BUILD FROM RELEASE)
>
> Some steps may not work on your machine — still refining for a stable build.

## Requirements

- Arch Linux machine or VM to build
- `archiso` and `git` installed

```bash
sudo pacman -S archiso git
```

---

## Fork & Build

```bash
# 1. Fork this repo on GitHub, then clone your fork
git clone https://github.com/ProjectArcade/Arcade-OS
cd Arcade-OS

# 2. Build the ISO (requires root)
sudo mkarchiso -v -w /tmp/arcade-work -o ./out Arcade-os/

# 3. ISO will be in ./out/
ls -lh out/
```

### Clean rebuild

```bash
sudo rm -rf /tmp/arcade-work ./out
sudo mkarchiso -v -w /tmp/arcade-work -o ./out Arcade-os/
```

---

## Project Structure

```
Arcade-OS/
└── Arcade-OS/
    ├── profiledef.sh
    ├── packages.x86_64
    ├── pacman.conf
    ├── bootstrap_packages
    ├── airootfs/
    ├── efiboot/
    ├── grub/
    └── syslinux/
```

---

## Live Session Credentials

| Field | Value |
|---|---|
| Username | `arcade` |
| Password | `arcade` |

## License

GPL-2.0 — see [LICENSE](LICENSE) for details.