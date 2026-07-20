class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.55"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.55/pave-darwin-arm64"
    sha256 "2ce84c0e7790d1ec202368585f0bdeb7ed9db3cefaf532429238ca40b28b2406"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.55/pave-linux-arm64"
      sha256 "3e6282a9198076aa3669017fd7dec9e8559627249bb8f6f97e99703c0881b19e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.55/pave-linux-x64"
      sha256 "8d3430d1ca0d50f11cb7783bd258a17458c338369f94e106c9f340d178c7d995"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
