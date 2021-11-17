class Minikube < Formula
  desc "Run Kubernetes locally"
  url "https://github.com/cloudposse/packages.git"
  version "1.24.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/minikube" do
      system "make", "install"
      bin.install "cloudposse/minikube"
    end
  end
end
