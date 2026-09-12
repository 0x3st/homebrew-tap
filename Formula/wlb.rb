require "language/python"

class Wlb < Formula
  include Language::Python::Virtualenv
  desc "Agentic AI benchmark of CUHK-Shenzhen (essay / SVG / quant / scheduling)"
  homepage "https://github.com/0x3st/wl-benchmark"
  url "https://github.com/0x3st/wl-benchmark/releases/download/v0.4.9/wl_benchmark-0.4.9.tar.gz"
  sha256 "b71a24394b1798830baa48708534b8c2e0b85d13b2a4734ac0f707020611e769"
  license "MIT"
  version "0.4.9"

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
