class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.25"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.25/pave-darwin-arm64"
    sha256 "bbb7709663e59df3520c41712812de980df00e7903687aa86524f133a3057dd8"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.25/pave-linux-x64"
    sha256 "7bceed2a9e15eadd0f8eec55f3d19b92d635916db9d8117d5c35619f1a211065"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
