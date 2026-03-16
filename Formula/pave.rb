class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.57/pave-darwin-arm64"
      sha256 "2ab117771f43740a842855662d73ae78763f24afdca85fe3ea6e08da65054957"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.57/pave-darwin-x64"
      sha256 "df9a14fcf0acf0e306bf31b5cea4f753f02ed69d3a2001c91dfa26b46fbdc7d4"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.57/pave-linux-x64"
    sha256 "d0b26cfc270e95835b8bfe27c1529bbfb773e8402c53bbacd765f3785f0e30df"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
