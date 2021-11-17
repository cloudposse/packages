class Popeye < Formula
  desc "A Kubernetes cluster resource sanitizer"
  url "https://github.com/cloudposse/packages.git"
  version "0.9.8"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/popeye" do
      system "make", "install"
      bin.install "cloudposse/popeye"
    end
  end
end
