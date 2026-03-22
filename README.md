# Arcade-OS

> A lightweight, fast, and beautifully customized Linux distribution built on Arch Linux — designed to run smoothly on low-end hardware while delivering a modern desktop experience.

[![Arch Linux](https://img.shields.io/badge/based%20on-Arch%20Linux-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org)
[![License](https://img.shields.io/badge/license-GPL--v2-blue)](LICENSE)
[![Status](https://img.shields.io/badge/status-alpha-orange)]()

---

## What is Arcade-OS?

Arcade-OS is a custom Arch Linux distribution focused on three things: **speed**, **simplicity**, and **style**. It strips away the bloat found in most modern distros while keeping a polished, responsive desktop that works well even on machines with limited resources.

It is built using `archiso` — the same tool used to build the official Arch Linux ISO — giving it a clean, reproducible, and hackable foundation.

---

## Why Arcade-OS?

Most Linux distros make you choose between looks and performance. Arcade-OS does not. It is built from the ground up to be:

- **Fast** — boots quickly, stays responsive, uses RAM wisely
- **Minimal** — only what you need, nothing you don't
- **Customizable** — built on Arch, so everything is one `pacman` command away
- **Stable** — rolling release base means you are always up to date
- **Accessible** — works on hardware that other modern distros struggle with

---

## System Requirements

| Component | Minimum | Recommended |
|---|---|---|
| RAM | **2 GB** | 4 GB |
| Storage | 10 GB | 20 GB+ |
| CPU | x86_64, 1 GHz | Dual-core 1.5 GHz+ |
| GPU | VESA/basic | Any with Mesa support |
| Boot | BIOS or UEFI | UEFI |

---

## Project Structure
```
Arcade-OS/
└── Arcade-os/              # archiso profile (based on releng)
    ├── profiledef.sh       # ISO name, label, build settings
    ├── packages.x86_64     # All packages included in the ISO
    ├── pacman.conf         # Pacman config used during build
    ├── bootstrap_packages  # Minimal packages for bootstrap mode
    ├── airootfs/           # Root filesystem overlay
    ├── efiboot/            # UEFI boot entries
    ├── grub/               # GRUB bootloader config
    └── syslinux/           # BIOS/syslinux bootloader config
```

---

## Building the ISO

### Requirements

You need an **Arch Linux** machine (or VM) to build. Install the required tool:
```bash
sudo pacman -S archiso git
```

### Build
```bash
# 1. Clone the repo
git clone https://github.com/ProjectArcade/Arcade-OS
cd Arcade-OS

# 2. Build (requires root)
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

## Testing the ISO

### QEMU
```bash
qemu-system-x86_64 \
  -enable-kvm -m 2G -cpu host \
  -bios /usr/share/ovmf/x64/OVMF.fd \
  -cdrom out/arcade-os-*.iso \
  -vga virtio -display sdl
```

### Flash to USB (Not Recomended for NON TECH USERS)
```bash
# WARNING: replaces /dev/sdX with your USB — this erases it
sudo dd if=out/arcade-os-*.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

---

## Live Session Credentials

| Field | Value |
|---|---|
| Username | `arcade` |
| Password | `arcade` |

---


---
## License

GPL-2.0 — see [LICENSE](LICENSE) for details.