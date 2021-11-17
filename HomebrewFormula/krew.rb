class Krew < Formula
  desc "Kubectl plugin manager"
  url "https://github.com/cloudposse/packages.git"
  version "0.4.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/krew" do
      system "make", "install"
      bin.install "cloudposse/krew"
    end
  end
end
