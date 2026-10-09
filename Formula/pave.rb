class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.113"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.113/pave-darwin-arm64.tar.gz"
    sha256 "5699bae5259fdee677334971664c07f9d40b4dea53b2175ba8db898d64bc1699"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.113/pave-linux-arm64"
      sha256 "db20e6cbe703407ce903329abb8897d962dce9df6ae05ed9b8d356375328d85c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.113/pave-linux-x64"
      sha256 "a3afe6028df919dfe03a315755aa7056b9d1815e4b2257265a2fada21306ab0f"
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
