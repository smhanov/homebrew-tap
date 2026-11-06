# smhanov/tap

Homebrew tap for [squint](https://github.com/smhanov/squint) — review
what your LLM just committed, in a terminal UI.

```sh
brew install smhanov/tap/squint
```

The formula ships the prebuilt release binaries and is updated per
release; goreleaser will automate the update once a fine-grained PAT
(`HOMEBREW_TAP_GITHUB_TOKEN`) is configured as a secret on the squint
repository (see .goreleaser.yaml — the tap push targets
`homebrew_casks`, so switching goreleaser to a formula publisher will
follow this change).
