class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.7"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.7/pave-darwin-arm64"
      sha256 "e7a892eacf0dc8040e25bc101046063c92a49307b899b7b427dead5ba6f54bc1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.7/pave-darwin-x64"
      sha256 "fafa5a8ca68e1cd4f89894fa09b21aeff787c1e613ffc9b18b584c653c71a5a4"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.7/pave-linux-x64"
    sha256 "895e8992a0afeb3f91b04a07cb1d9f85210397f2d8c8f984f176cdfc32541e89"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
