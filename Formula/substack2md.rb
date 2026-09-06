class Substack2md < Formula
  include Language::Python::Virtualenv

  desc "Export Substack newsletters to clean Markdown with YAML frontmatter"
  homepage "https://github.com/snapsynapse/substack2md"
  url "https://github.com/snapsynapse/substack2md/releases/download/v2.2.0/substack2md-2.2.0.tar.gz"
  sha256 "952dcc47dd3a0a7cffa425e324e8e3dc1501724bbf2a0e6fce467976ea08a99a"
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
    url "https://files.pythonhosted.org/packages/f3/ce/ee2ecad540810a79593028e88299baeae54d346cc7a0d94b6199988b89b1/certifi-2026.5.20.tar.gz"
    sha256 "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079/chardet-5.2.0.tar.gz"
    sha256 "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e7/a1/67fe25fac3c7642725500a3f6cfe5821ad557c3abb11c9d20d12c7008d3e/charset_normalizer-3.4.7.tar.gz"
    sha256 "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
  end

  resource "cssselect" do
    url "https://files.pythonhosted.org/packages/72/0a/c3ea9573b1dc2e151abfe88c7fe0c26d1892fe6ed02d0cdb30f0d57029d5/cssselect-1.3.0.tar.gz"
    sha256 "57f8a99424cfab289a1b6a816a43075a4b00948c86b4dcf3ef4ee7e15f7ab0c7"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cd/63/9496c57188a2ee585e0f1db071d75089a11e98aa86eb99d9d7618fc1edce/idna-3.18.tar.gz"
    sha256 "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/05/3b/aab6728cae887456f409b4d75e8a01856e4f04bd510de38052a47768b680/lxml-6.1.1.tar.gz"
    sha256 "ba96ae44888e0185281e937633a743ea90d5a196c6000f82565ebb0580012d40"
  end

  resource "lxml-html-clean" do
    url "https://files.pythonhosted.org/packages/0a/63/195dfdde380a84df309e3bccf4384b034b745dba43426886f7ae623b4fba/lxml_html_clean-0.4.5.tar.gz"
    sha256 "e2a4c7d5beedd17cd7b484d848a0571e54baa239a4f9df5546e3acba7f990560"
  end

  resource "markdownify" do
    url "https://files.pythonhosted.org/packages/3f/bc/c8c8eea5335341306b0fa7e1cb33c5e1c8d24ef70ddd684da65f41c49c92/markdownify-1.2.2.tar.gz"
    sha256 "b274f1b5943180b031b699b199cbaeb1e2ac938b75851849a31fd0c3d6603d09"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093/packaging-26.3.tar.gz"
    sha256 "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "readability-lxml" do
    url "https://files.pythonhosted.org/packages/e9/fb/e7c40afabd660f121fca9f0993e39dc042974c80a6c04ec4b27d7fbd7323/readability_lxml-0.9.tar.gz"
    sha256 "f7a5f88ee194ed6c5aa36d14593fbfb20c5d7bb8f3f5bc57734288d45a5abe26"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/47/2c/0a5f6f8ee0d5589e48c7640213ed5175d52cf540a06725b628cc1a45d6ce/soupsieve-2.8.4.tar.gz"
    sha256 "e121fd02e975c695e4e9e8774a5ee35d74714b59307868dcc5319ad2d9e3328e"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953/urllib3-2.7.0.tar.gz"
    sha256 "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
  end

  resource "websocket-client" do
    url "https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1/websocket_client-1.9.0.tar.gz"
    sha256 "9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98"
  end

  def install
    virtualenv_install_with_resources
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
