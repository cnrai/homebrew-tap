class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.107"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.107/pave-darwin-arm64.tar.gz"
    sha256 "47d42047048dfc4fadc0a1a6113699a7478b84c7b1e13f6a8241ba908551f59e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.107/pave-linux-arm64"
      sha256 "56dca6dc8fed87d917c8f8c56ce1c612e2ea09df96cb8e1342ff2326494f34ca"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.107/pave-linux-x64"
      sha256 "d1048c75fe7a432b89aa9c877c4f170955df6b8e947966e24548b5c6b4f95417"
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
