class Kops < Formula
  desc "Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
  url "https://github.com/cloudposse/packages.git"
  version "1.22.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kops" do
      system "make", "install"
      bin.install "cloudposse/kops"
    end
  end
end
