class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.2"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.2/pave-darwin-arm64"
    sha256 "3be889483e6273790d5b5e3cd7202575689499eb025d361c3bf6d856b10da99b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.2/pave-linux-arm64"
      sha256 "781ca1c71ce938ac762d6cdfce9840de963f35a6cb3991d60406a5936eaf0b74"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.2/pave-linux-x64"
      sha256 "1c4b6c659f056f3c5e075baae489f76f7a1b1f0df7a4282260040ed5772e7ee3"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
