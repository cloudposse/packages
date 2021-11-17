class Kfctl < Formula
  desc "Machine Learning Toolkit for Kubernetes"
  url "https://github.com/cloudposse/packages.git"
  version "1.2.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kfctl" do
      system "make", "install"
      bin.install "cloudposse/kfctl"
    end
  end
end
