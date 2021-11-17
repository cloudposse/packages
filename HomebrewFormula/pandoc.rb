class Pandoc < Formula
  desc "Universal markup converter"
  url "https://github.com/cloudposse/packages.git"
  version "2.16.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/pandoc" do
      system "make", "install"
      bin.install "cloudposse/pandoc"
    end
  end
end
