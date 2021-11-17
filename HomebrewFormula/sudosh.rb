class Sudosh < Formula
  desc "Shell wrapper to run a login shell with `sudo` as the current user for the purpose of audit logging"
  url "https://github.com/cloudposse/packages.git"
  version "0.3.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/sudosh" do
      system "make", "install"
      bin.install "cloudposse/sudosh"
    end
  end
end
