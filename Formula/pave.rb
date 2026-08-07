class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.70"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.70/pave-darwin-arm64"
    sha256 "2c1cc9deb38b8f209533611f766ee86cad17cb0abb70cc8360019ce22a7a3b89"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.70/pave-linux-arm64"
      sha256 "77b53167709908474f3c19a8718aaaf8ff9b0c4fdb00ca538561688583409885"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.70/pave-linux-x64"
      sha256 "b404cdd93a360d3135495facae9321287c0c6cde4861267b16c4f60342396718"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
