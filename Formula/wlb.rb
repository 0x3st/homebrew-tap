require "language/python"

class Wlb < Formula
  include Language::Python::Virtualenv
  desc "Agentic AI benchmark of CUHK-Shenzhen (essay / SVG / quant / scheduling)"
  homepage "https://github.com/0x3st/wl-benchmark"
  url "https://github.com/0x3st/wl-benchmark/releases/download/v0.5.0/wl_benchmark-0.5.0.tar.gz"
  sha256 "01cef14a70c271f4463f266dd5328ef41aac869ad7533ab365f28d4e77882f95"
  license "MIT"
  version "0.5.0"

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
