class Kops1.12 < Formula
  desc "Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
  url "https://github.com/cloudposse/packages.git"
  version "1.12.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kops-1.12" do
      system "make", "install"
      bin.install "cloudposse/kops-1.12"
    end
  end
end
