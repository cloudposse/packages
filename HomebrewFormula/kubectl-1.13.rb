class Kubectl1.13 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.13)"
  url "https://github.com/cloudposse/packages.git"
  version "1.13.12"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.13" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.13"
    end
  end
end
