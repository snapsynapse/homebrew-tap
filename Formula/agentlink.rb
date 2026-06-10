class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool — symlinks, no codegen"
  homepage "https://agentlink.run/"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.3.0/agentlink-darwin-arm64"
      sha256 "3131d5aee3799f80c8c7c77f1bb94db3585fd4ce9673b67fe512701098c8cdc3"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.3.0/agentlink-darwin-amd64"
      sha256 "dddf320bc346dc9a991ebaf05e0f0e0fbba2de328f6655196d3b049f7089298c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.3.0/agentlink-linux-arm64"
      sha256 "595a87db06a3f7f4b430b8ecfcfad07d47c2b72f2eaf905b14442bf0b7fe07ce"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.3.0/agentlink-linux-amd64"
      sha256 "2e2514ed70c16966c6f0956da7b0217146d3fc350001b5bfa12bd95282379a3c"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
