class Shfmt < Formula
  desc "A shell parser, formatter and interpreter (POSIX/Bash/mksh)"
  url "https://github.com/cloudposse/packages.git"
  version "3.4.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/shfmt" do
      system "make", "install"
      bin.install "cloudposse/shfmt"
    end
  end
end
