class Terrahelp < Formula
  desc "Terraform helper. Terrahelp is as a command line utility written in Go and is aimed at providing supplementary functionality which can sometimes prove useful when working with Terraform."
  url "https://github.com/cloudposse/packages.git"
  version "0.7.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terrahelp" do
      system "make", "install"
      bin.install "cloudposse/terrahelp"
    end
  end
end
