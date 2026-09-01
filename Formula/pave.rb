class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.101"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-darwin-arm64.tar.gz"
    sha256 "6f8b667b124e1b1aebc1c3c0888810cd200799552cf13891b76dd8b1dc11aa60"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-linux-arm64"
      sha256 "034b82566f1746832dbc499e3d9b28a9d20bf5461c62744c453a24fadeda416c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-linux-x64"
      sha256 "ea3c7c623934b60f66177fdcea75053fdcbac55d56f9ad5b20f852dbbea3b941"
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
