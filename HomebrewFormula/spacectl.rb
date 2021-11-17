class Spacectl < Formula
  desc "[Spacelift.io](https://spacelift.io/) client and CLI"
  url "https://github.com/cloudposse/packages.git"
  version "0.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/spacectl" do
      system "make", "install"
      bin.install "cloudposse/spacectl"
    end
  end
end
