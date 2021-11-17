class Cli53 < Formula
  desc "Command line tool for Amazon Route 53"
  url "https://github.com/cloudposse/packages.git"
  version "0.8.18"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/cli53" do
      system "make", "install"
      bin.install "cloudposse/cli53"
    end
  end
end
