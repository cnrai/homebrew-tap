class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.13"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.13/pave-darwin-arm64"
      sha256 "127efd68855e81b6b422c46bf24b52fca7e63245f904106db00b9d9acb3ec15c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.13/pave-darwin-x64"
      sha256 "b23d0378e64db02a54ccaf5c18bd6d8bb9824cee201ecd8dc03df696b3460760"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.13/pave-linux-x64"
    sha256 "0098737a3ed53979312ad0889a49c341885c8fefec96a2c3a4bcf37f56c6a8d3"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
