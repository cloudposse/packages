class Helm2 < Formula
  desc "The Kubernetes Package Manager"
  url "https://github.com/cloudposse/packages.git"
  version "2.17.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/helm2" do
      system "make", "install"
      bin.install "cloudposse/helm2"
    end
  end
end
