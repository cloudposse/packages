class Nomad < Formula
  desc "Hashicorp nomad"
  url "https://github.com/cloudposse/packages.git"
  version "0.12.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/nomad" do
      system "make", "install"
      bin.install "cloudposse/nomad"
    end
  end
end
