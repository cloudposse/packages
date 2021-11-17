class Gosu < Formula
  desc "Simple Go-based setuid+setgid+setgroups+exec"
  url "https://github.com/cloudposse/packages.git"
  version "1.14.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gosu" do
      system "make", "install"
      bin.install "cloudposse/gosu"
    end
  end
end
