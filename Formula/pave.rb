class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.9"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.9/pave-darwin-arm64"
      sha256 "330dd67937c1cab936e9164f368df69be0950205d406a9d20f3bd02663650fc7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.9/pave-darwin-x64"
      sha256 "3e06cbb5f6144c25525a394010dc044fff61a4e793638159592122e173eff9e5"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.9/pave-linux-x64"
    sha256 "39882bdbaa785b1885c56f0bb3642a466362851e7686974b408ce00ec1b9ef2e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
