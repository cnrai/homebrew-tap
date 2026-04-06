class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.33"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.33/pave-darwin-arm64"
      sha256 "a3cbe2409a2226879ca6faf8d49aa282961fc7d2809cd8072c25ef21be881313"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.33/pave-darwin-x64"
      sha256 "e49fb1ef07c7b5b2f5b08f0d9fe4fcef51e14a5cf2e35fe416968d83fc9d246f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.33/pave-linux-x64"
    sha256 "afdebadfad9f83db5a9b6a076c092c65d9116d898d5482ee513d62b3cf24df9e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
