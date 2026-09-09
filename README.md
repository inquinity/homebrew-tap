# inquinity/homebrew-tap

Homebrew tap for **[Belvedere](https://github.com/inquinity/belvedere)** — a fork of
[Markdown Preview](https://github.com/pluk-inc/markdown-preview) with its outbound
network connections (crash reporting, usage analytics, auto-update checks) removed,
for use on networks where the upstream app's traffic isn't acceptable.

## Install

```sh
brew install --cask inquinity/tap/belvedere
```

That is shorthand for:

```sh
brew tap inquinity/homebrew-tap
brew install --cask belvedere
```

## Update

```sh
brew update && brew upgrade --cask belvedere
```

The app has no built-in updater, so `brew upgrade` is how new builds are picked up.
Each version is published as a GitHub Release on this repository, with the signed and
notarized disk image attached.

## Contents

| Cask       | App                                                                       |
| ---------- | ------------------------------------------------------------------------- |
| `belvedere` | Sandboxed Markdown previewer with a Quick Look extension. Source in [`inquinity/belvedere`](https://github.com/inquinity/belvedere). |

## License

Cask definitions in this repository are [MIT](LICENSE) licensed. The applications
they install carry their own licenses.
