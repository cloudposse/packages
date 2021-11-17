class K3d < Formula
  desc "Little helper to run Rancher Lab's k3s in Docker"
  url "https://github.com/cloudposse/packages.git"
  version "5.1.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/k3d" do
      system "make", "install"
      bin.install "cloudposse/k3d"
    end
  end
end
