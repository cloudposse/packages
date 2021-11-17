class Kubeval < Formula
  desc "Validate your Kubernetes configuration files, supports multiple Kubernetes versions"
  url "https://github.com/cloudposse/packages.git"
  version "0.16.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubeval" do
      system "make", "install"
      bin.install "cloudposse/kubeval"
    end
  end
end
