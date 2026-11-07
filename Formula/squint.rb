class Squint < Formula
  desc "Review what your LLM just committed, in a terminal UI"
  homepage "https://github.com/smhanov/squint"
  version "1.0.1"
  license "MIT"

  livecheck do
    url "https://github.com/smhanov/squint/releases/latest"
    strategy :github_latest
  end

  # Built from source: prebuilt-binary pours stall at dyld on macOS 26
  # (Homebrew quarantines release artifacts; the ad-hoc-signed binary
  # hangs in the dynamic loader even with the flag stripped). A source
  # build produces a clean local binary with no Gatekeeper involvement.
  url "https://github.com/smhanov/squint/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c52b68b9daca417e1a878fb28f831e7aecc35db787ca30083dbd2c68ae3421f3"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/squint"
  end

  # macOS 26 can stall the first exec of a brew-poured binary forever
  # (dyld never completes). Rewriting the file after the pour gives it
  # a fresh inode and it runs.
  def post_install
    f = bin/"squint"
    tmp = bin/"squint.rewrite"
    FileUtils.mv(f, tmp)
    FileUtils.cp(tmp, f)
    File.delete(tmp)
    File.chmod(0o755, f)
  end

  test do
    repo = testpath/"repo"
    system "git", "init", repo
    assert_match version.to_s, shell_output("\#{bin}/squint --version")
  end
end
