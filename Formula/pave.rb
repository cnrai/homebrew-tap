class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.35/pave-darwin-arm64"
      sha256 "558d5895316c3f3c7cd2e9f607d69b4f28a578daa31fc1cd103d05ff7ea69b74"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.35/pave-darwin-x64"
      sha256 "70ee8f230d77aa78e5db1eb7039cf8bce9d99989131c83c4491b0d329914e7fc"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.35/pave-linux-x64"
    sha256 "96e5f876fe50817ae72060807141680020c26492d2fa172ad2dbee072dda6390"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
