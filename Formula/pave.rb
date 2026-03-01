class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.17/pave-darwin-arm64"
      sha256 "00f63f0f18a5ed959fbef2fea590b6259f398a2500678450e4a027ff72059444"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.17/pave-darwin-x64"
      sha256 "da4ddf0d39f3e1016af36298176e172849e4bc4519ef9bce51b729a1f8756593"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.17/pave-linux-x64"
    sha256 "eff22915b5305a3248987f66e87cf17c3e710c0d720065569fa68d962511a191"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
