class Thanos < Formula
  desc "Highly available Prometheus setup with long term storage capabilities. CNCF Sandbox project."
  url "https://github.com/cloudposse/packages.git"
  version "0.23.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/thanos" do
      system "make", "install"
      bin.install "cloudposse/thanos"
    end
  end
end
