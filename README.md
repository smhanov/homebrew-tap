# smhanov/tap

Homebrew tap for [squint](https://github.com/smhanov/squint) — review
what your LLM just committed, in a terminal UI.

```sh
brew install smhanov/tap/squint
```

The formula ships a source build (Go via Homebrew) and is bumped
manually per release (version + source sha256). goreleaser automates
the scoop bucket update once a token (`SCOOP_GITHUB_TOKEN`) is
configured as a secret on the squint repository.
