class Direnv < Formula
  desc "Unclutter your .profile"
  url "https://github.com/cloudposse/packages.git"
  version "2.28.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/direnv" do
      system "make", "install"
      bin.install "cloudposse/direnv"
    end
  end
end
