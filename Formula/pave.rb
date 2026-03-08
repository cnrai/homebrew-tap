class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-arm64"
      sha256 "5a5bd84b034c19af0bb0fdc3a3c72ca8ca80c8674632e1347bc53e913876d1d2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-x64"
      sha256 "1997903d1aa98504b7290753a48c0694210f671339ec28b5b46ca5954e4a7f8d"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-linux-x64"
    sha256 "a796296973f4555f4adab617f18b18fcbfd987e246c10ec5792a78830a66d3fe"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
