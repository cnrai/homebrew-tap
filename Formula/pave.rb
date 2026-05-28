class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.6"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.6/pave-darwin-arm64"
    sha256 "c1fca38cc0b483c60f493c9b5ba541d2f068a1e8c4090c83892b8cf8c14f7827"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.6/pave-linux-arm64"
      sha256 "e72bba131d1daaeaf00ec7507793fbe81311e57dea0a0a5290295d9d1d50e282"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.6/pave-linux-x64"
      sha256 "762cf90262f0b28935a82b2bb0d103f6858524b0df1e9f938f0dff044d78eb9a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
