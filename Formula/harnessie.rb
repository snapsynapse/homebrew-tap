class Harnessie < Formula
  include Language::Python::Virtualenv

  desc "Brain-agnostic multi-agent harness with verification gates and audit log"
  homepage "https://harnessie.com/"
  url "https://files.pythonhosted.org/packages/2e/c1/e6aa21440584f1ca0098aaa7e86132ca6c9fab9000360b847f27c96fc5e0/harnessie-0.7.1.tar.gz"
  sha256 "a584cfbda10eeb4e6993077d5a766644a248204cde68caff23988db7382ba4c7"
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
