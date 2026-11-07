class Squint < Formula
  desc "Review what your LLM just committed, in a terminal UI"
  homepage "https://github.com/smhanov/squint"
  version "1.0.1"
  license "MIT"

  livecheck do
    url "https://github.com/smhanov/squint/releases/latest"
    strategy :github_latest
  end

  # Built from source, statically (CGO_ENABLED=0), matching the
  # release artifacts.
  url "https://github.com/smhanov/squint/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c52b68b9daca417e1a878fb28f831e7aecc35db787ca30083dbd2c68ae3421f3"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/squint"
  end

  def caveats
    <<~CAVEATS
      macOS 26 (Tahoe) has a known OS bug where the first launch of a
      Homebrew-installed binary can stall in dyld for a long time
      (syspolicyd scan; the same affects other brew-installed CLIs).
      If `squint` hangs right after install, either wait for the scan
      to complete or use the go-install path instead:

        go install github.com/smhanov/squint/cmd/squint@latest
    CAVEATS
  end

  test do
    system "git", "init", testpath/"repo"
    assert_match version.to_s, shell_output("#{bin}/squint --version")
  end
end
