class Gotop < Formula
  desc "A terminal based graphical activity monitor inspired by gtop and vtop"
  url "https://github.com/cloudposse/packages.git"
  version "3.0.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gotop" do
      system "make", "install"
      bin.install "cloudposse/gotop"
    end
  end
end
