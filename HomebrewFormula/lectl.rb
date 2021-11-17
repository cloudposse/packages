class Lectl < Formula
  desc "Script to check issued certificates by Let's Encrypt on CTL (Certificate Transparency Log) using https://crt.sh"
  url "https://github.com/cloudposse/packages.git"
  version "0.21.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/lectl" do
      system "make", "install"
      bin.install "cloudposse/lectl"
    end
  end
end
