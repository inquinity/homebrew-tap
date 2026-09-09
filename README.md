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
| `qltextview` | Quick Look previews for text-based config and source files. Source: [`inquinity/QLTextView`](https://github.com/inquinity/QLTextView). |

## License

Cask definitions in this repository are [MIT](LICENSE) licensed. The applications
they install carry their own licenses.
