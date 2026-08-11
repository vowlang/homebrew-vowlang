# homebrew-vowlang

Homebrew tap for [Vow](https://vowlang.dev) — native compiler + vpm.

## Install

```bash
brew tap vowlang/tap https://github.com/vowlang/homebrew-vowlang
brew install vow
vow version
```

Or after the tap is published to GitHub:

```bash
brew tap vowlang/tap
brew install vow
```

## Update formula checksums (maintainers)

After deploying new tarballs to `install.vowlang.dev`:

```bash
./installers/update-homebrew-sha256.sh
git -C ../homebrew-vowlang commit -am "vow: update bottle checksums"
```

## What gets installed

Prebuilt release from `install.vowlang.dev`:

- `vow` — native compiler
- `vpm` — package manager
- `share/vow/release/` — runtime.o, bundled lld, libLLVM

Same layout as `curl -fsSL https://install.vowlang.dev | sh`, but under Homebrew's prefix (`$(brew --prefix)`).
