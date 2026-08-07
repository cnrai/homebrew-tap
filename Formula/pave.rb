class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.68"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.68/pave-darwin-arm64"
    sha256 "5148fe720429ac218e88692ad64249a00d7755d8637a347cd31d59adc25c6703"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.68/pave-linux-arm64"
      sha256 "f02c1d22d73c0ba507edf1056c69fcf2adbbe7e55d9d9f4e8b4e5d03a1572265"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.68/pave-linux-x64"
      sha256 "2e386c221b4ce8cb53179a72838b8a14774031a3d05ff5ddd4572e87ac6a2e34"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
