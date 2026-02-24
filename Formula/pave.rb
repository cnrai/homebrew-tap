# typed: false
# frozen_string_literal: true

# Homebrew Formula for PAVE
# Personal AI Virtual Environment - Terminal-based AI agent system
#
# Install via:
#   brew tap cnrai/tap
#   brew install pave

class Pave < Formula
  desc "Personal AI Virtual Environment - Terminal-based AI agent system"
  homepage "https://github.com/cnrai/openpave"
  url "https://github.com/cnrai/pave-dist/archive/refs/tags/v0.3.11.tar.gz"
  sha256 "0c957a0855f7328f196a0905f347554854f6272d6c7932ae2aaff4319e88c422"
  license "MIT"
  head "https://github.com/cnrai/pave-dist.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # SpiderMonkey provides the 'js' command for secure sandbox execution
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey compartment
  # with strict permission controls (network, filesystem, system commands)
  depends_on "spidermonkey"

  def install
    # Install the pre-compiled native binary directly
    # All code (including sandbox) is bundled and obfuscated inside the binary
    
    # Detect platform and architecture
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pave-darwin-arm64" => "pave"
      else
        bin.install "pave-darwin-x64" => "pave"
      end
    else
      if Hardware::CPU.arm?
        bin.install "pave-linux-arm64" => "pave"
      else
        bin.install "pave-linux-x64" => "pave"
      end
    end
  end

  def caveats
    <<~EOS
      PAVE has been installed!

      Quick Start:
        pave                    # Start the terminal UI
        pave --help             # Show available options

      Configuration:
        Set OPENCODE_URL to your AI backend (default: http://localhost:4096)
        
        Example:
          export OPENCODE_URL=http://your-server:4096
          pave

      Skill Management:
        pave install gmail      # Install a skill from marketplace
        pave list               # List installed skills
        pave search <query>     # Search marketplace

      Sandbox:
        AI-generated scripts run in an isolated SpiderMonkey sandbox.
        Configure permissions in ~/.pave/permissions.yaml

      Debug Mode:
        DEBUG=1 pave

      For more information:
        https://github.com/cnrai/openpave
    EOS
  end

  test do
    # Test that the CLI responds to --help
    output = shell_output("#{bin}/pave --help 2>&1")
    assert_match(/pave|usage|options|help/i, output)
    
    # Test version output
    version_output = shell_output("#{bin}/pave --version 2>&1")
    assert_match(/\d+\.\d+/, version_output)
    
    # Test that SpiderMonkey's js command is available
    js_output = shell_output("#{Formula["spidermonkey"].opt_bin}/js -e 'print(\"sandbox ready\")' 2>&1")
    assert_match(/sandbox ready/, js_output)
  end
end