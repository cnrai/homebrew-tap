class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.22"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.22/pave-darwin-arm64"
    sha256 "60fc6d894a909e6849e27159bdd2d3f4737a7654b548a19c5d10d3360de9b705"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.22/pave-linux-x64"
    sha256 "77f4615a05aa0c09e7a0d4866533b5926a77933e05ebb9155d28bd20c0b2ec0f"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
