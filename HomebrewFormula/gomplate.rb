class Gomplate < Formula
  desc "A flexible commandline tool for template rendering. Supports lots of local and remote datasources."
  url "https://github.com/cloudposse/packages.git"
  version "3.10.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gomplate" do
      system "make", "install"
      bin.install "cloudposse/gomplate"
    end
  end
end
