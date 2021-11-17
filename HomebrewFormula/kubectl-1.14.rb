class Kubectl1.14 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.14)"
  url "https://github.com/cloudposse/packages.git"
  version "1.14.10"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.14" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.14"
    end
  end
end
