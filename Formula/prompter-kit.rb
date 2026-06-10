class PrompterKit < Formula
  desc "Backup, restore, and manage Elgato Prompter scripts from the command-line"
  homepage "https://prompterkit.app/"
  url "https://github.com/snapsynapse/prompter-kit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1b464b08b4ba3929faad0609e77d221d513b7be0134650475b67e8be3a2ee1fc"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "prompter_kit.py"
    (bin/"prompter-kit").write <<~SH
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/prompter_kit.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      This installs the prompter-kit CLI only. The local web GUI needs Flask;
      see https://github.com/snapsynapse/prompter-kit for GUI setup.
    EOS
  end

  test do
    assert_match(/prompter|usage/i, shell_output("#{bin}/prompter-kit --help"))
  end
end
