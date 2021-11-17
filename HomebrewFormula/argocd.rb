class Argocd < Formula
  desc "GitOps Continuous Delivery for Kubernetes"
  homepage "https://argoproj.github.io/cd"
  # url "https://github.com/cloudposse/packages"
  head "https://github.com/cloudposse/packages.git", branch: "homebrew"
  version "homebrew"
  # tag:      "v2.1.6",
  # revision: "a346cf933e10d872eae26bff8e58c5e7ac40db25"
  # license "Apache-2.0"

  def install
    # ENV["INSTALL_PATH"] = HOMEBREW_PREFIX
    chdir "vendor/argocd" do
      # system "sudo", "make", "install"
      system "make", "install"
    end
  end

  # test do
  #   assert_match "argocd controls a Argo CD server",
  #     shell_output("#{bin}/argocd --help")

  #   # Providing argocd with an empty config file returns the contexts table header
  #   touch testpath/"argocd-config"
  #   assert_match "CURRENT  NAME  SERVER\n",
  #     shell_output("#{bin}/argocd context --config ./argocd-config")
  # end
end
