class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.25/pave-darwin-arm64"
      sha256 "4a73f1b09b4c7fa065d9948cf8cfe2379efed6de3088148155605a877c36f204"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.25/pave-darwin-x64"
      sha256 "9994778789fc3b7566fe5eb79d1e7f72082a751b9a3c4b8eeef484868322d8c7"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.25/pave-linux-x64"
    sha256 "fde19998833734df28b2fd0fe217c0eb4ffa7ac88c9a86d9720e092861bea8c4"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
