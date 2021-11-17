class Sentrycli < Formula
  desc "A command line utility to work with Sentry."
  url "https://github.com/cloudposse/packages.git"
  version "1.71.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/sentry-cli" do
      system "make", "install"
      bin.install "cloudposse/sentry-cli"
    end
  end
end
