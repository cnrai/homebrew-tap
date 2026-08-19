class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.79"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.79/pave-darwin-arm64"
    sha256 "14feba042a8d733d3d24ea9da6361e1233e628d4ed13c72e5e6aae77d1c00dbf"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.79/pave-linux-arm64"
      sha256 "9102329b37be314c1135814ca77d675744dbe8a3f8040e14a4df28c97595d85e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.79/pave-linux-x64"
      sha256 "08881a141496b4ae9bc558a068d35f0753029e03f7c6334dcba94d9023aad2a4"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
