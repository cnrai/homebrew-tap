class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.91"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.91/pave-darwin-arm64.tar.gz"
    sha256 "133817db165b7a70aa0ac2e9d2cbf4920e400d2691ecb9b074377f1027a36cf9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.91/pave-linux-arm64"
      sha256 "772483bf7639add090efdabc44851c3ad0be1d6b39aca1585b376cc62432c072"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.91/pave-linux-x64"
      sha256 "8d30a79e227fcef73fb9031ac05a61f1b7ce24cc4f9bef88bb83253d270dc74b"
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
