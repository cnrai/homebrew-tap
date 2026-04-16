class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.8"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.8/pave-darwin-arm64"
      sha256 "f2c42ec376fa7bee67e9a4d374b158afbdf757ce901faa46809a4214edbde064"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.8/pave-darwin-x64"
      sha256 "8e5d1a2f8b6f05cca5a3d5c09243ceb90fe4773f3a27fdd71ec2f37fb1635517"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.8/pave-linux-x64"
    sha256 "40a003bd745acdf3eef90c5ad8c4fdd535a0665307a15fa5206be33d20dc3126"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
