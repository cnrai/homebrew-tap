class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.61/pave-darwin-arm64"
      sha256 "b27cc9244948d7d2cc2704cebba39f4974f12687433d8eb87aaa4b021c3898f3"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.61/pave-darwin-x64"
      sha256 "1f47c0f99a6e2b6d2ac41ea92af197351a1b2e74efdf8d4e3026d99b336c249b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.61/pave-linux-x64"
    sha256 "33ceafb5988ed4842deb104a3e80293cd00053079e941ebe29e00d4d748c7aca"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
