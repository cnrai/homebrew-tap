class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.11"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.11/pave-darwin-arm64"
    sha256 "34a1ab3e209d32a156e68576400aa40a96da82289fec939bdbbb54f352ba98b0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.11/pave-linux-arm64"
      sha256 "525b808f01fe390989f76df6b5d1bcca53ce6f69c39ffbb1869d0343230d9a27"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.11/pave-linux-x64"
      sha256 "946ac75f283b793d2a1e0f35254f590193eac7e7d6bc2bba96499453d0e55f28"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
