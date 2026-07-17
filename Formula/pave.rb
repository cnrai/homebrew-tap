class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.47"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.47/pave-darwin-arm64"
    sha256 "3824b4df18ab2863d8c09ecc09d624ab115d4037c72416a9779c3e40d798d586"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.47/pave-linux-arm64"
      sha256 "58d1f60e539f57fb8a40c208bd058ed8fc3976fdbb8370c6a42bc86aac0f8c08"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.47/pave-linux-x64"
      sha256 "599c3b35aaa180dd7eb71c5468cce5fc4e98cccdd7c0b5f6e12d30a13776c820"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
