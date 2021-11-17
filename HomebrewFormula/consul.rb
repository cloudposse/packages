class Consul < Formula
  desc "Hashicorp consul"
  url "https://github.com/cloudposse/packages.git"
  version "1.10.4"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/consul" do
      system "make", "install"
      bin.install "cloudposse/consul"
    end
  end
end
