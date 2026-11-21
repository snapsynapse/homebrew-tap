class Agentlink < Formula
  desc "Sync one AGENTS.md to every AI coding tool - symlinks, no codegen"
  homepage "https://agentlink.run/"
  license "MIT"

  # Agentlink is retired; this formula pins the final release.
  deprecate! date: "2026-11-21", because: "is retired and receives no further releases"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.7.0/agentlink-darwin-arm64"
      sha256 "fd2933926a3398ae29b2f9dd3eecdeed8c40c8f9171471147af5d743651b3021"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.7.0/agentlink-darwin-amd64"
      sha256 "fde1c7a9d621112a6c2c3aa1225a9142853b577593b38bef5418626fa531efda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.7.0/agentlink-linux-arm64"
      sha256 "f9741feeb4c9fc1dbeb7e7bf5588a4fdada8b0c36e4d02123783a0ccef2ef4db"
    else
      url "https://github.com/snapsynapse/agentlink/releases/download/v0.7.0/agentlink-linux-amd64"
      sha256 "0910b2482d02cb0a724db784ff540ff0294e2c6be2e86737b1ae9cbca7cd948c"
    end
  end

  def install
    bin.install Dir["agentlink-*"].first => "agentlink"
  end

  def caveats
    <<~EOS
      Agentlink is retired. If you installed automatic triggers with an
      earlier release, remove them:
        agentlink hooks remove --all
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlink --version")
  end
end
