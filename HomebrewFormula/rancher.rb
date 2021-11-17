class Rancher < Formula
  desc "Rancher CLI"
  url "https://github.com/cloudposse/packages.git"
  version "2.4.13"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/rancher" do
      system "make", "install"
      bin.install "cloudposse/rancher"
    end
  end
end
