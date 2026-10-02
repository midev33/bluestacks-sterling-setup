# Reproducible BlueStacks 5 + Sterling Book & Go setup

This repository documents a repeatable Windows 10/11 setup for Sterling Sport & Wellness / Sterling Book & Go in BlueStacks 5. It contains instructions and a helper script only.

> **Installer note:** The BlueStacks binary is intentionally **not** stored here. Download it from BlueStacks' official site/CDN during setup. This avoids GitHub size limits and does not redistribute software that may be subject to BlueStacks licensing terms.

## Prerequisites

- Windows 10 or Windows 11, fully updated.
- A Windows account allowed to install software and approve UAC prompts.
- Hardware virtualization enabled in UEFI/BIOS (Intel VT-x or AMD-V/SVM).
- Internet access for the official BlueStacks download and Google Play.
- Sufficient disk space and RAM for BlueStacks and the app.

### Virtualization and Hyper-V notes

1. In **Task Manager → Performance → CPU**, confirm that **Virtualization** is enabled. If it is disabled, enable Intel VT-x/AMD-V (the exact firmware name varies) in UEFI/BIOS.
2. BlueStacks 5 has Hyper-V-compatible and non-Hyper-V configurations. Keep the Windows virtualization features that your organization requires; choose the BlueStacks build/mode recommended by the current BlueStacks installer.
3. If BlueStacks reports a Hyper-V conflict, read the current BlueStacks support guidance before changing Windows Features. Do not disable Hyper-V, Virtual Machine Platform, Windows Hypervisor Platform, or Core Isolation on a managed machine without captain/IT approval.

## Setup steps

1. Clone or download this repository.
2. Run `scripts/install-bluestacks.ps1` from an elevated PowerShell window, or use the official download page manually:
   - <https://www.bluestacks.com/download.html>
   - Official installation guidance: <https://support.bluestacks.com/hc/en-us/articles/360061525271-How-to-download-and-install-BlueStacks-5>
3. Complete the BlueStacks installer. Restart Windows if it requests a restart.
4. Open BlueStacks 5 and finish its first-run setup.
5. Open **Google Play Store**, sign in with the authorized Google account, and search for **Sterling Book & Go**.
6. Install the app. The package hint is `com.s24.bookandgo`; verify the app name and publisher before installing. See `scripts/install-sterling-notes.md`.
7. **STOP before logging in to Sterling.** Do not put credentials in this repository or in scripts. Obtain any Sterling credentials from the captain through the approved channel, then continue interactively if authorized.

## Re-running or troubleshooting

- Re-run the script only if the installer is missing or a newer official URL has been provided.
- If Play Store cannot find the app, confirm the BlueStacks Android instance and use the package hint in the notes file; do not download APKs from third-party sites.
- Record the BlueStacks version, Windows version, instance type, and error text when asking for support. Do not record passwords, access tokens, or recovery codes.

## Files

- `README.md` — prerequisites, installation flow, and safety boundaries.
- `scripts/install-bluestacks.ps1` — downloads the official Windows installer and launches it.
- `scripts/install-sterling-notes.md` — Play Store discovery notes for Sterling Book & Go.
