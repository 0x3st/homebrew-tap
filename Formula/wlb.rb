require "language/python"

class Wlb < Formula
  include Language::Python::Virtualenv
  desc "Agentic AI benchmark of CUHK-Shenzhen (essay / SVG / quant / scheduling)"
  homepage "https://github.com/0x3st/wl-benchmark"
  url "https://github.com/0x3st/wl-benchmark/releases/download/v0.6.4/wl_benchmark-0.6.4.tar.gz"
  sha256 "f817d819be8afe542d2e94769e4a2c2e5aa32082d1f3f6d2ca35c7273a19587b"
  license "MIT"
  version "0.6.4"

  depends_on "python@3.12"

  def install
    # stdlib-only package: a bare venv install has no resources
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wlb --version")
  end
end
