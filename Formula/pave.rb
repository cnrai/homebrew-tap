class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.3"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.3/pave-darwin-arm64"
      sha256 "181e4acbe0f2d48410fc3811c9c2c723f92f40815843e473870dbee6e68a1b64"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.3/pave-darwin-x64"
      sha256 "a10ee400df229229f136ab416f4a5bf249cf0113f13a527d3dfe7dd806d83d37"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.3/pave-linux-x64"
    sha256 "4739f444f37e9d2c9db013b896497bb5f9a7f9f1881280d7a7088ec24cd2add8"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
