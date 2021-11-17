class K9s < Formula
  desc "Kubernetes CLI To Manage Your Clusters In Style"
  url "https://github.com/cloudposse/packages.git"
  version "0.25.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/k9s" do
      system "make", "install"
      bin.install "cloudposse/k9s"
    end
  end
end
