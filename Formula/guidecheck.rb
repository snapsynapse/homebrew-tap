class Guidecheck < Formula
  desc "Local verifier for GuideCheck Human-Verifiable Assistant Guides"
  homepage "https://guidecheck.org/"
  url "https://github.com/snapsynapse/guidecheck/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "60fc48734baf4f7b9b041f76291a1af90d196d613d72c5e0a4b517c72ea91426"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "scripts/guidecheck_verify.py", "scripts/guidecheck_constants.py"
    (bin/"guidecheck-verify").write <<~SH
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/guidecheck_verify.py" "$@"
    SH
  end

  test do
    output = shell_output("#{bin}/guidecheck-verify --help")
    assert_match "assistant-guide", output
  end
end
