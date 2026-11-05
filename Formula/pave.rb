class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.121"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.121/pave-darwin-arm64.tar.gz"
    sha256 "1ed365ce5ac998b44698ff2ecc273e170d774175583e005a7e61b97e0e0087c3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.121/pave-linux-arm64"
      sha256 "c49a86ffccfb83452818fa8f64004327f2d8ac80072988a10b224bbb90439acf"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.121/pave-linux-x64"
      sha256 "4ccfe1302eb9d11078153739aa8d41af93b561efb6dbbcf7809318b07808574c"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
