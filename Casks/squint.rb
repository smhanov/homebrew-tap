cask "squint" do
  version "1.0.1"

  homepage "https://github.com/smhanov/squint"
  desc "Review what your LLM just committed, in a terminal UI"
  name "squint"

  livecheck do
    url "https://github.com/smhanov/squint/releases/latest"
    strategy :github_latest
  end

  binary "squint"

  on_arm do
    url "https://github.com/smhanov/squint/releases/download/v#{version}/squint_#{version}_darwin_arm64.tar.gz"
    sha256 "62e774659841aa34865494d20edb770670bbe2877342b5ddf924d289e0cd3d9c"
  end
  on_intel do
    url "https://github.com/smhanov/squint/releases/download/v#{version}/squint_#{version}_darwin_amd64.tar.gz"
    sha256 "6e1cfc66314030e59d939573e7eb55ff226e5bc0f41be2481bf9484a662c2412"
  end
end
