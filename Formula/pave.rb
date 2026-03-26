class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.6"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.6/pave-darwin-arm64"
      sha256 "70629645b9700e0ed32b2d1983666cba9d2da8fab993521be2568e5afc0c2405"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.6/pave-darwin-x64"
      sha256 "7b271544aad3fec094fa0452c4d3712717bd4dd5b428290a2181fdddc74c7b9d"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.6/pave-linux-x64"
    sha256 "8674d377b12dda059b0b143d3ec7e60933ee80dba40fad3ac574b3d4b37e6d8b"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
