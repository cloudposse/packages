class Helmfile < Formula
  desc "Deploy Kubernetes Helm Charts"
  url "https://github.com/cloudposse/packages.git"
  version "0.142.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/helmfile" do
      system "make", "install"
      bin.install "cloudposse/helmfile"
    end
  end
end
