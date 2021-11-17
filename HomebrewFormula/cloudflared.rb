class Cloudflared < Formula
  desc "Argo Tunnel client"
  url "https://github.com/cloudposse/packages.git"
  version "2021.11.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/cloudflared" do
      system "make", "install"
      bin.install "cloudposse/cloudflared"
    end
  end
end
