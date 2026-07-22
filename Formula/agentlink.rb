class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool — symlinks, no codegen"
  homepage "https://agentlink.run/"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.0/agentlink-darwin-arm64"
      sha256 "52e846ad48e94a40afa0623b9999a7d19fa60a0f4c766d6699749926e615e717"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.0/agentlink-darwin-amd64"
      sha256 "e24c52914c5364333d16c5bc10b6207495cb2a540e0e25ded83e9f3f314e7694"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.0/agentlink-linux-arm64"
      sha256 "611b11b6fc1993191562eebf5a6b8b83bcf1c85f644e7d6b84f3d62841c23706"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.0/agentlink-linux-amd64"
      sha256 "45737c5c0964a10fd249f8c6540631208a416affd2ffac445f01afd4f62c0d40"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
