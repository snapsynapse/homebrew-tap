class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool - symlinks, no codegen"
  homepage "https://agentlink.run/"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.2/agentlink-darwin-arm64"
      sha256 "481c3a2de5f019a4304ee8e54bc301915e89cc2509f248615625de75198e783d"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.2/agentlink-darwin-amd64"
      sha256 "81b7fd33d542a62e8956041de3975379a5a124678b55b6a3a5d7ad081ca3ad8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.2/agentlink-linux-arm64"
      sha256 "36e27797a6a6927a4d04f724ca203f4c601f3e26dc5011cc517e8e01b9e3d2af"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.2/agentlink-linux-amd64"
      sha256 "9372ad52c3fdf051bdfdd6809c42e9051dcc51604dcc5fdabd8ffe1d735aaf4f"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
