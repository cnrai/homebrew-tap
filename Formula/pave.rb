class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.32"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.32/pave-darwin-arm64"
    sha256 "a269293e577f354715e67f1ada79ba345ea497ec5e7136deecfe6279eef0e91e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.32/pave-linux-arm64"
      sha256 "3eb64bb5423bd689062da3245e7d998cf1341e017bff84c56189b359c6d26bcb"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.32/pave-linux-x64"
      sha256 "8ea3c2282583d19c1dd84906d9e7141495696a4f9a2aa2b9b851cb401f4cb5ef"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
