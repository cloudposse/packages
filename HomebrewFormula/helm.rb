class Helm < Formula
  desc "The Kubernetes Package Manager"
  url "https://github.com/cloudposse/packages.git"
  version "3.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/helm" do
      system "make", "install"
      bin.install "cloudposse/helm"
    end
  end
end
