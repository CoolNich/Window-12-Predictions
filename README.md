# Windows 12 OS (concept)

A tiny bootable Linux (Debian live) that starts straight into the Windows 12 web desktop, with a real local AI (llama.cpp + Qwen2.5 1.5B). Works offline.

## Get the ISO
1. Push this repo to GitHub (branch `main`).
2. The **Build ISO** action runs automatically (about 20 to 40 minutes).
3. Download `windows12-os.iso` from the repo's **Releases** page.

## Try it
- VM: `qemu-system-x86_64 -m 4G -enable-kvm -cdrom windows12-os.iso -vga virtio`
- USB: flash with Ventoy or balenaEtcher, then boot from it.

## Customize
- Desktop and apps: `config/includes.chroot/opt/win12/web/index.html`
- Other model: change `MODEL_URL` in `.github/workflows/build.yml` (any small GGUF chat model)
- Packages: `config/package-lists/win12.list.chroot`

## Notes
- Needs a 64-bit PC with 4 GB RAM or more. Replies take a few seconds on older CPUs.
- llama.cpp is built from its latest commit. Pin a release tag in `0100-llama.hook.chroot` if a build breaks.
- Hybrid ISO boots on BIOS and UEFI. Secure Boot must be off.
