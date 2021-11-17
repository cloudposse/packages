class Kubectl1.20 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.19)"
  url "https://github.com/cloudposse/packages.git"
  version "1.20.12"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.20" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.20"
    end
  end
end
