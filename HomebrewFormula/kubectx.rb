class Kubectx < Formula
  desc "Switch faster between clusters and namespaces in kubectl"
  url "https://github.com/cloudposse/packages.git"
  version "0.9.4"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectx" do
      system "make", "install"
      bin.install "cloudposse/kubectx"
    end
  end
end
