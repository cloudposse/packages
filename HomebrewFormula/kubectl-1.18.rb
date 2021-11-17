class Kubectl1.18 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.18)"
  url "https://github.com/cloudposse/packages.git"
  version "1.18.20"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.18" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.18"
    end
  end
end
