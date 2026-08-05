class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool — symlinks, no codegen"
  homepage "https://agentlink.run/"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.1/agentlink-darwin-arm64"
      sha256 "8a2f0b2d0903171f3a4f60bfd598bde9353fa0e90c7c0a972adda7fd01fa2790"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.1/agentlink-darwin-amd64"
      sha256 "31d4b69b4e990094cc3eaf86a8e5ab93dfdfdfaeb9522d2a14014b21edb7b8ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.1/agentlink-linux-arm64"
      sha256 "e5514c7fb45488d9aae28e835103d100a6d5f6fa8eed8fb2a1182d731e55ceee"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.4.1/agentlink-linux-amd64"
      sha256 "a7a04e4581b262c767a859e48f2b59d4be9989147a70067832d41c7eca88e8f8"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
