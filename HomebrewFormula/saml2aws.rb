class Saml2aws < Formula
  desc "CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP"
  url "https://github.com/cloudposse/packages.git"
  version "2.33.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/saml2aws" do
      system "make", "install"
      bin.install "cloudposse/saml2aws"
    end
  end
end
