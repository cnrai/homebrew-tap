class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.19"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.19/pave-darwin-arm64"
    sha256 "226e356ad12b76b86e0b8da58c1acad979ce5a3871cd4dcfd647d1140efb0c0c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.19/pave-linux-arm64"
      sha256 "9301100fedd5c1b26dcb1f9a6a857e6e7f82912768197d1675a27d3ab78bef2d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.19/pave-linux-x64"
      sha256 "32556db82095ac457c4a07f81cebebce3d7153f4d80e2a1e9250047489e125e9"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
