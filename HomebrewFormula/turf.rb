class Turf < Formula
  desc "Turf is Cloud Posse's command-line automation helper."
  url "https://github.com/cloudposse/packages.git"
  version "0.17.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/turf" do
      system "make", "install"
      bin.install "cloudposse/turf"
    end
  end
end
