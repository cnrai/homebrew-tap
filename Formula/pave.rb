class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.43"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.43/pave-darwin-arm64"
    sha256 "62688cea93e38b3f5c7d6141755231f162cd02406a2c4d57bb7ab626b51aa292"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.43/pave-linux-arm64"
      sha256 "bc7b1ac19020cc8dd74a3ce47f3fc8bac916f5befb9ff1e4b4183eda70f629ce"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.43/pave-linux-x64"
      sha256 "5bf62cc6cce72a426fa35b3901f7fbf1d9dd89c9efad3368a8dfa5a30232c9b3"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
