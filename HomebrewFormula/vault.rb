class Vault < Formula
  desc "Hashicorp vault"
  url "https://github.com/cloudposse/packages.git"
  version "1.8.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/vault" do
      system "make", "install"
      bin.install "cloudposse/vault"
    end
  end
end
