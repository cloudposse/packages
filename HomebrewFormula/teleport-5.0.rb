class Teleport5.0 < Formula
  desc "Secure Access for Developers that doesn't get in the way."
  url "https://github.com/cloudposse/packages.git"
  version "5.0.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/teleport-5.0" do
      system "make", "install"
      bin.install "cloudposse/teleport-5.0"
    end
  end
end
