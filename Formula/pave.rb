class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.59"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.59/pave-darwin-arm64"
    sha256 "562ea284f7e57a32f2b7db0841999aebe6912b8b40625f7cc12e98f869cdf182"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.59/pave-linux-arm64"
      sha256 "755880d69e74dffcf5b03843ae87f419841099001fb7102316e4e299e5f16097"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.59/pave-linux-x64"
      sha256 "649468e8d3f02acdeb7d5db0867a2df087e73bc7aa5bf4503e5f82ff28cec318"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
