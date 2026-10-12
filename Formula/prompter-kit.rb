class PrompterKit < Formula
  desc "Backup, restore, and manage Elgato Prompter scripts from the command-line"
  homepage "https://prompterkit.app/"
  url "https://github.com/snapsynapse/prompter-kit/releases/download/v1.0.3/prompterkit-1.0.3.tar.gz"
  sha256 "736e0753a25fb3f7d280820a983450d2f5c1caab6bffb46d6e2977d51f529e28"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "prompter_kit.py"
    (bin/"prompter-kit").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3.13" "#{libexec}/prompter_kit.py" "$@"
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

    content = "  account_id #42 **literal**  \n1. Keep numbering\n\n[link](url)\n"
    (testpath/"source.txt").write content
    library = testpath/"library"
    system bin/"prompter-kit", "import", testpath/"source.txt", "--name", "Same", "--base-dir", library
    system bin/"prompter-kit", "export", "--name", "Same", "--output", testpath/"roundtrip.txt",
           "--base-dir", library
    assert_equal content, (testpath/"roundtrip.txt").read

    system bin/"prompter-kit", "import", testpath/"source.txt", "--name", "same", "--index", "1",
           "--base-dir", library
    output = testpath/"exported"
    output.mkpath
    (output/"SAME.txt").write "keep me"
    system bin/"prompter-kit", "export", "--all", "--output", output, "--base-dir", library

    assert_equal "keep me", (output/"SAME.txt").read
    files = output.children
    assert_equal 3, files.length
    assert_equal 3, files.map { |path| path.basename.to_s.downcase }.uniq.length
    files.reject { |path| path.basename.to_s == "SAME.txt" }.each do |path|
      assert_equal content, path.read
    end
  end
end
