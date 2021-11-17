class Argocd < Formula
  desc "GitOps Continuous Delivery for Kubernetes"
  homepage "https://argoproj.github.io/cd"
  url "https://github.com/cloudposse/packages.git"
  version "v2.1.6"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/argocd" do
      system "make", "install"
      bin.install "cloudposse/argocd"
    end
  end
end
