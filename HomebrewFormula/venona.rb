class Venona < Formula
  desc "Codefresh runtime-environment agent"
  url "https://github.com/cloudposse/packages.git"
  version "1.6.10"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/venona" do
      system "make", "install"
      bin.install "cloudposse/venona"
    end
  end
end
