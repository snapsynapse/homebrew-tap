class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool - symlinks, no codegen"
  homepage "https://agentlink.run/"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.5.0/agentlink-darwin-arm64"
      sha256 "572fedc6cf5d0b8674a5ae0917fe4a90ecbe8dd80604a3bbff5913ec40466647"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.5.0/agentlink-darwin-amd64"
      sha256 "04618876b827e77579d09f7120b356ae7c1339d7c58ccec90731772563f36594"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.5.0/agentlink-linux-arm64"
      sha256 "6ea3c82a98fd009bcb4ab3ff54e79206680d7f5161b91f9e09cf49466e7323c1"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.5.0/agentlink-linux-amd64"
      sha256 "34a946cd441f3e531edba82abcc2cf7e4332ee5ef9dcc8ca769a21dafaf62e39"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
