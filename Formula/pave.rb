class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.1/pave-darwin-arm64"
      sha256 "c3cfccf9e1f427d179d2cf76cb883a0175e770d475edf3a2f793dc1b78a3e1ec"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.1/pave-darwin-x64"
      sha256 "6e0151e68506e12e119e203bb5bd143a51d538c290f7f84eb4191efb9017d68b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.1/pave-linux-x64"
    sha256 "be577ac5b6b0a96ef774a4f539580efdee8e274d8f2277db14cc8448b1d5b190"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
