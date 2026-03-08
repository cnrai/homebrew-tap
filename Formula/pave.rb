class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-arm64"
      sha256 "cdc293cff8d55833e7e86be97ec4e78e47a4d094be35e043199205e175fab7ac"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-x64"
      sha256 "b95a68306b9f4862f301cd0535ca9ca3512f4bca2b94d7d71ae14148b51a1ee2"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-linux-x64"
    sha256 "f342ec7eabb6e112493f8fcee1be97e18b274974e5037ca3081ca6eda57de757"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
