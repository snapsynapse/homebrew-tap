class Substack2md < Formula
  include Language::Python::Virtualenv

  desc "Export Substack newsletters to clean Markdown with YAML frontmatter"
  homepage "https://github.com/snapsynapse/substack2md"
  url "https://github.com/snapsynapse/substack2md/releases/download/v3.0.0/substack2md-3.0.0.tar.gz"
  sha256 "c42f2e99d19a5c411ee90c1b5f72fe342f2e9743ebb91ad1174dbbfa4c13ea40"
  license "MIT"

  depends_on "libyaml"
  depends_on "python@3.13"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/43/65/318323f98dbee45d42dff61d8f047181bc6f2268a9068cfad035a46be5af/beautifulsoup4-4.15.0.tar.gz"
    sha256 "288e3ca7d54b06f2ac191970bc275c1939cb46d450b255bf6718b04aa37ab4f7"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/51/33/4cd27639502f010084bcef7a2036391dd637439901341ce1a530f36f6e51/certifi-2026.11.20.tar.gz"
    sha256 "af1cb240a8133f105aa52684a3a3258339d7f2fd0bd4e2812698ff5cf5588c4e"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079/chardet-5.2.0.tar.gz"
    sha256 "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89/charset_normalizer-3.5.2.tar.gz"
    sha256 "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
  end

  resource "cssselect" do
    url "https://files.pythonhosted.org/packages/72/0a/c3ea9573b1dc2e151abfe88c7fe0c26d1892fe6ed02d0cdb30f0d57029d5/cssselect-1.3.0.tar.gz"
    sha256 "57f8a99424cfab289a1b6a816a43075a4b00948c86b4dcf3ef4ee7e15f7ab0c7"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/23/ad/28ecd7cb894d172f3c9c80a075eeeb2017ac62e3632cee05a5f9493547eb/lxml-6.1.3.tar.gz"
    sha256 "45222d94ddd511536f3b2f7d9deae3b2339b4ce0f075f1ca25703b07cad9dd21"
  end

  resource "lxml-html-clean" do
    url "https://files.pythonhosted.org/packages/ac/7e/2b7118b28d5bb69dfc4f349e1ca92334cf986601d3c809caa62cfa3bfab6/lxml_html_clean-0.4.6.tar.gz"
    sha256 "ea9db067c3053854fd87f8d5a1cf01221dc893b54dbf6019c689052e05c64f22"
  end

  resource "markdownify" do
    url "https://files.pythonhosted.org/packages/98/29/5e46d8d7aa6c66c73809c0018a435b3271d01fa0f54f8215d634a6a92051/markdownify-1.2.4.tar.gz"
    sha256 "3837f5eb4caa627473451f9ebb91e00d0f12120fc64d64246bea23934244bd01"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/76/b8/c0b780928e2fb1c87e9e375818c6f121da2398b071012d1747be300b83f4/pyyaml-6.0.4.tar.gz"
    sha256 "e24bf71af8a432d7808fabff134d38dfe16d3cbb41f2873bb4b1e42422de0a1a"
  end

  resource "readability-lxml" do
    url "https://files.pythonhosted.org/packages/e9/fb/e7c40afabd660f121fca9f0993e39dc042974c80a6c04ec4b27d7fbd7323/readability_lxml-0.9.tar.gz"
    sha256 "f7a5f88ee194ed6c5aa36d14593fbfb20c5d7bb8f3f5bc57734288d45a5abe26"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/82/77/d59ca6aa338bdd8d880234d15b7c466cb176e44502899a9df81ba2e13cd0/soupsieve-4.1.3.tar.gz"
    sha256 "13f70186c8f40bf8d0ff7bbab09a18fb149600b465269207b5e5b588f55fda08"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  resource "websocket-client" do
    url "https://files.pythonhosted.org/packages/d8/cb/a5abcc2891249f393827c650c6296660ce40374ac22d99ab9aea41f9d2a2/websocket_client-1.9.2.tar.gz"
    sha256 "0fcb57545848be86992e128218fd96dd87a6769ffdb1a968dff79632b85604d0"
  end

  def install
    virtualenv_install_with_resources system_site_packages: false
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/substack2md --version")
    (testpath/"input.md").write <<~MARKDOWN
      # Homebrew smoke test

      This paragraph must survive conversion.
    MARKDOWN
    system bin/"substack2md", "--from-md", testpath/"input.md",
           "--url", "https://example.substack.com/p/homebrew-smoke",
           "--base-dir", testpath/"output"
    notes = (testpath/"output").glob("**/*.md")
    assert_equal 1, notes.length
    assert_match "This paragraph must survive conversion.", notes.first.read
  end
end
