class Teleport < Formula
  desc "Secure Access for Developers that doesn't get in the way."
  url "https://github.com/cloudposse/packages.git"
  version "8.0.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/teleport" do
      system "make", "install"
      bin.install "cloudposse/teleport"
    end
  end
end
