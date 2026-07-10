class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.34"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.34/pave-darwin-arm64"
    sha256 "b56d44afb17d8038011a707780d44eee5f15d010b8a12ce3625538c886c449d0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.34/pave-linux-arm64"
      sha256 "8ee02826a4e0e74fe8bce03b8a06431ef4bfc145da8cc6f74d7d005f7b38e05d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.34/pave-linux-x64"
      sha256 "a936bca4f77e210478ad17f1587310c7fb00a72f2954de891e4ba3f20766ac41"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
