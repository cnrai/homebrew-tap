class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.32"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.32/pave-darwin-arm64"
      sha256 "524b8f1cdb28c42208b7121fe2d98ac45b9902b4272935dfd8cd35da6e64bfc0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.32/pave-darwin-x64"
      sha256 "21f666e3403816d0fd7dec1dc619346c351f58ac7c2a8cb0df1d35d33e91096e"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.32/pave-linux-x64"
    sha256 "585a016acc5b51a1a7aa00f0e7f2b9aa933311861503d51a74bcb29bee308184"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
