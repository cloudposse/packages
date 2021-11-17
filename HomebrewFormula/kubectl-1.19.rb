class Kubectl1.19 < Formula
  desc "Production-Grade Container Scheduling and Management (v1.19)"
  url "https://github.com/cloudposse/packages.git"
  version "1.19.16"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl-1.19" do
      system "make", "install"
      bin.install "cloudposse/kubectl-1.19"
    end
  end
end
