class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.118"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.118/pave-darwin-arm64.tar.gz"
    sha256 "ece1da4aaf07a9f57ea609710f4f14980503331e41a3180e0a5729dcc8424b71"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.118/pave-linux-arm64"
      sha256 "0f9bf8f16e3d997c5d680b5a705b2257e2a94e0907a91ed828d25487f04877aa"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.118/pave-linux-x64"
      sha256 "749c9545a1b18408c04b4d153e2c9af91a37e41ccb8df70d81cbcd1e09ed51e8"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
