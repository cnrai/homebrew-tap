class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.4"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.4/pave-darwin-arm64"
      sha256 "76a4bdbe9053299e7b6d85ea704095d395f9206020508829d8834ccfa9782e03"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.4/pave-darwin-x64"
      sha256 "24ac0ce121ce9a8609e16f048ab198fdc751fc62df13a78d045463093934ee1b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.4/pave-linux-x64"
    sha256 "1faa8a931957775e2b32aef5708dbc9a44aff22bd97980ef0ba2517605524e38"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
