class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.9"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.9/pave-darwin-arm64"
      sha256 "4570c6d3f1552698a48fd4a96b59d1021821d9a3be9a206c5a8a8ef2fd3340c6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.9/pave-darwin-x64"
      sha256 "11983f21b6ece5bcb578b62a0be42d1e7574f057b405f3fbb05a1871928ca986"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.9/pave-linux-x64"
    sha256 "b8ff020e99f423e61dfd00058e3ae15d6c10adcde34b5405b9dea064e53c0034"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
