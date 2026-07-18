class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.53"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.53/pave-darwin-arm64"
    sha256 "af1d7ae4ddd7d948c858641120d2963aec2c8d3c6a39d79c3e1d90dd0dc2f536"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.53/pave-linux-arm64"
      sha256 "1580b46d796450eaeff35e4d9f34da226ad8199912ca0b35fead894698e95a63"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.53/pave-linux-x64"
      sha256 "eb9c019df8cd34310163d0221365da28f8e4e24d120dfff0c9a4f44fb94c69aa"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
