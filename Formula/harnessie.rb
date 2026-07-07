class Harnessie < Formula
  include Language::Python::Virtualenv

  desc "Brain-agnostic multi-agent harness with verification gates and audit log"
  homepage "https://harnessie.com/"
  url "https://files.pythonhosted.org/packages/95/7b/baa8c7ea19dbdbdac0fafe31478b781e3de2ac535553c26cf284ef557912/harnessie-0.6.0.tar.gz"
  sha256 "4e431d610e9f08c4ccdb5113fb774a96cc68b04a12d5c5bd10de5212903c9295"
  license "Apache-2.0"

  depends_on "python@3.13"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Scaffold a project with the guided check skipped, then confirm the
    # scaffold exists and the zero-dollar guided run reports ready.
    system bin/"harnessie", "init", "demo", "--no-verify"
    assert_path_exists testpath/"demo/config/models.yaml"
    output = shell_output("#{bin}/harnessie init demo 2>&1")
    assert_match "You are ready", output
  end
end
