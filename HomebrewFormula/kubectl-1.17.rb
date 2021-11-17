class Kubectl1.17 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.17)"
  url "https://github.com/cloudposse/packages.git"
  version "1.17.17"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.17" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.17"
    end
  end
end
