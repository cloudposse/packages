class Kubectl1.16 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.16)"
  url "https://github.com/cloudposse/packages.git"
  version "1.16.15"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.16" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.16"
    end
  end
end
