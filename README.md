# inquinity/homebrew-tap

Homebrew tap for [inquinity](https://github.com/inquinity)'s macOS apps.

## Install

Add the tap and trust it:

```sh
brew tap inquinity/tap
brew trust --tap inquinity/tap
```

## Security

Every app in this tap is signed with a Developer ID certificate and notarized by
Apple, so Gatekeeper accepts it without a warning. Development is security-centric:
an app does not reach outside itself, whether the network or files it was not handed,
without asking for your approval first.

## Tap Contents

| App | Version | Description |
| --- | --- | --- |
| `belvedere` | ![latest release](https://img.shields.io/github/v/release/inquinity/belvedere?label=) | Sandboxed Markdown previewer, a fork of [Markdown Preview](https://github.com/pluk-inc/markdown-preview) with its outbound network connections removed. Source and releases: [`inquinity/belvedere`](https://github.com/inquinity/belvedere). |
| `openinterminal-lite-inquinity` | ![latest release](https://img.shields.io/github/v/release/inquinity/OpenInTerminal?label=) | Finder toolbar app to open the current directory in Terminal, a fork of [OpenInTerminal-Lite](https://github.com/Ji4n1ng/OpenInTerminal) with the macOS 26 toolbar icon fix. Conflicts with the official `openinterminal-lite` cask. Source: [`inquinity/OpenInTerminal`](https://github.com/inquinity/OpenInTerminal). |
| `qltextview` | ![latest release](https://img.shields.io/github/v/release/inquinity/QLTextView?label=) | Quick Look previews for text-based config and source files. Source: [`inquinity/QLTextView`](https://github.com/inquinity/QLTextView). |
| `yatu` | ![latest release](https://img.shields.io/github/v/release/inquinity/yatu?label=) | Finder toolbar button that opens a terminal at the folder you are looking at, through a sandboxed Finder extension. Requires macOS 13+. Uses code from [OpenInTerminal](https://github.com/Ji4n1ng/OpenInTerminal) (MIT). Coexists with `openinterminal-lite-inquinity`, which stays for older Macs. Source: [`inquinity/yatu`](https://github.com/inquinity/yatu). |
