class Cfssl < Formula
  desc "Cloudflare's PKI and TLS toolkit"
  url "https://github.com/cloudposse/packages.git"
  version "1.6.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/cfssl" do
      system "make", "install"
      bin.install "cloudposse/cfssl"
    end
  end
end
