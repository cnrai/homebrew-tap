class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.38"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.38/pave-darwin-arm64"
    sha256 "6b54678a9e83da1cd4f389305f8b8f3f2708c0dfeb652629c7a0254a98693bf3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.38/pave-linux-arm64"
      sha256 "4730aea358175c41c6fffedce4c95222a0a88ab06fecefa18e8a45511504079b"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.38/pave-linux-x64"
      sha256 "9c87413c9c7a799a686f72a22e17bafb831cef6f4f89caeb1184af93ea538a60"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
