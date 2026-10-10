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

| App                             | Version                                                                                          | Description                                                                                                                                                                                                                                                                                                                                                                          |
| ------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [`belvedere`](https://github.com/inquinity/belvedere) | ![latest release](https://img.shields.io/github/v/release/inquinity/belvedere?label=) | Markdown reader with Quick Look previews, hardened so that opening a file someone else sent you is safe: nothing in a document can reach the network, run something, or fake a sign-in prompt.<br>Belvedere puts security before features. |
| [`desktop-name-manager`](https://github.com/inquinity/desktop-name-manager) | ![latest release](https://img.shields.io/github/v/release/inquinity/desktop-name-manager?label=) | Command-line tool that labels each Desktop (Space) by stamping its name into the wallpaper. Requires an Apple silicon Mac and macOS 26+. |
| [`openinterminal-lite-inquinity`](https://github.com/inquinity/OpenInTerminal) | ![latest release](https://img.shields.io/github/v/release/inquinity/OpenInTerminal?label=) | Finder toolbar app to open the current directory in Terminal, maintained for MacOS 12 compatibility. This is a fork of [OpenInTerminal-Lite](https://github.com/Ji4n1ng/OpenInTerminal). |
| [`qltextview`](https://github.com/inquinity) | ![latest release](https://img.shields.io/github/v/release/inquinity/QLTextView?label=) | Quick Look previews for text-based config and source files. |
| [`yatu`](https://github.com/inquinity/yatu) | ![latest release](https://img.shields.io/github/v/release/inquinity/yatu?label=) | Finder toolbar button that opens a terminal at the folder you are looking at, through a sandboxed Finder extension. Requires macOS 13+. |
