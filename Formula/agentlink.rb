class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool - symlinks, no codegen"
  homepage "https://agentlink.run/"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.6.0/agentlink-darwin-arm64"
      sha256 "0414da40d29e113981a339f1624fe0b5e4bf0a79844ae557cad725aa9d1ed467"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.6.0/agentlink-darwin-amd64"
      sha256 "a7f7fa998fc5afcc934a8445178ace70136a264ae2b1ce7d4167bd9204605abe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.6.0/agentlink-linux-arm64"
      sha256 "d7240e07f26eb8902c39d6bd725fb4e4546d05c06502f173efa15a85580e785c"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.6.0/agentlink-linux-amd64"
      sha256 "00ab792f86fcfebd27e0f58498c0423791be76ba8219128a5d633339b0ac7d15"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
