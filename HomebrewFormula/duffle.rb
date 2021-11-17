class Duffle < Formula
  desc "CNAB installer"
  url "https://github.com/cloudposse/packages.git"
  version "0.3.5-beta.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/duffle" do
      system "make", "install"
      bin.install "cloudposse/duffle"
    end
  end
end
