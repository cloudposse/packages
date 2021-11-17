class Emailcli < Formula
  desc "Command line email sending client written in Go."
  url "https://github.com/cloudposse/packages.git"
  version "1.0.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/emailcli" do
      system "make", "install"
      bin.install "cloudposse/emailcli"
    end
  end
end
