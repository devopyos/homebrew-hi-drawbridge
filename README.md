# homebrew-hi-drawbridge

Homebrew tap for installing [`hi-drawbridge`](https://github.com/devopyos/hi-drawbridge) on Linux.

This tap installs the tagged `hi-drawbridge` release archives from GitHub Releases.

## Requirements

- Linux with Homebrew installed
- `x86_64` or `arm64` architecture

## Install

```bash
brew tap devopyos/hi-drawbridge
brew install hi-drawbridge
```

If you prefer the fully qualified name:

```bash
brew install devopyos/hi-drawbridge/hi-drawbridge
```

## Update

```bash
brew update
brew upgrade hi-drawbridge
```

## Usage

```bash
hi-drawbridge --help
hi-drawbridge --version
```

## Manual Setup

The formula installs the binary and example setup assets. It does not install host integration for you.

After install, the packaged examples are available under Homebrew's share directory for the formula, and the main setup guide is:

- `$(brew --prefix)/share/hi-drawbridge/docs/manual-setup.md`

If you want BatteryWatch integration, copy the packaged systemd user unit and any needed `udev` rules and then follow the manual setup guide.

## Uninstall

```bash
brew uninstall hi-drawbridge
brew untap devopyos/hi-drawbridge
```

## Notes

- The formula is Linux-only.
- The tap installs the release tarball contents directly.
- Source code and releases are in the upstream project: <https://github.com/devopyos/hi-drawbridge>
