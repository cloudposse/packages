class Sops < Formula
  desc "Secrets management stinks, use some sops!"
  url "https://github.com/cloudposse/packages.git"
  version "3.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/sops" do
      system "make", "install"
      bin.install "cloudposse/sops"
    end
  end
end
