# inquinity/homebrew-tap

Homebrew tap for [inquinity](https://github.com/inquinity)'s macOS apps.

## Install

```sh
brew install --cask inquinity/tap/<cask>
```

for example `inquinity/tap/belvedere`. That is shorthand for:

```sh
brew tap inquinity/homebrew-tap
brew install --cask <cask>
```

## Update

```sh
brew update && brew upgrade --cask <cask>
```

These apps have no built-in updater, so `brew upgrade` is how new builds are picked up.
Each version is a GitHub Release with a signed, notarized disk image attached — on the
app's own repository where that repo is public, or on this repository otherwise.

## Contents

| Cask         | App                                                                                                                              |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `belvedere`  | Sandboxed Markdown previewer, a fork of [Markdown Preview](https://github.com/pluk-inc/markdown-preview) with its outbound network connections removed. Source: [`inquinity/belvedere`](https://github.com/inquinity/belvedere) (private); releases on this repo. |
| `openinterminal-lite-inquinity` | Finder toolbar app to open the current directory in Terminal, a fork of [OpenInTerminal-Lite](https://github.com/Ji4n1ng/OpenInTerminal) with the macOS 26 toolbar icon fix. Conflicts with the official `openinterminal-lite` cask. Source: [`inquinity/OpenInTerminal`](https://github.com/inquinity/OpenInTerminal). |
| `qltextview` | Quick Look previews for text-based config and source files. Source: [`inquinity/QLTextView`](https://github.com/inquinity/QLTextView). |
| `yatu`       | Finder toolbar button that opens a terminal at the folder you are looking at, through a sandboxed Finder extension. Requires macOS 13+. Uses code from [OpenInTerminal](https://github.com/Ji4n1ng/OpenInTerminal) (MIT). Coexists with `openinterminal-lite-inquinity`, which stays for older Macs. Source: [`inquinity/yatu`](https://github.com/inquinity/yatu). |

## License

Cask definitions in this repository are [MIT](LICENSE) licensed. The applications
they install carry their own licenses.
