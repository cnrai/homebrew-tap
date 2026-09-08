class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.103"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.103/pave-darwin-arm64.tar.gz"
    sha256 "500498a98739a6201a07a2880c8019f9411c3c17c5b629a9d8c42101aa3a3f27"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.103/pave-linux-arm64"
      sha256 "f2512ced5c40f08fbef9c7c2de4704fe264370d22c113662fc6d86785f152772"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.103/pave-linux-x64"
      sha256 "82a0c434d64849ec555d026702a1d526f37382172a9f9dc4291418a6eb046801"
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
