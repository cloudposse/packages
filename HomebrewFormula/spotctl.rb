class Spotctl < Formula
  desc "A unified CLI to manage your [Spot](https://spot.io/) resources."
  url "https://github.com/cloudposse/packages.git"
  version "0.20.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/spotctl" do
      system "make", "install"
      bin.install "cloudposse/spotctl"
    end
  end
end
