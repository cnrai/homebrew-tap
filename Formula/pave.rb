class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.36/pave-darwin-arm64"
      sha256 "dd915eb87096048b5b994e4465a2a37990a40c7a5e0cc530e514644f646460fa"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.36/pave-darwin-x64"
      sha256 "30a714d9ae54aafbddf311d9b4868bff49ee022f383ef1265fe8f94c496ab298"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.36/pave-linux-x64"
    sha256 "aa8afc6e88ed3fc2442b3a7e87aaf4fecdd10d42c68184b064039bc1cd2c87e5"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
