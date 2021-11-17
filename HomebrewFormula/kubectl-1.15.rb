class Kubectl1.15 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.15)"
  url "https://github.com/cloudposse/packages.git"
  version "1.15.12"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.15" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.15"
    end
  end
end
