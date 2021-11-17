class Htmltest < Formula
  desc ":white_check_mark: Test generated HTML for problems"
  url "https://github.com/cloudposse/packages.git"
  version "0.15.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/htmltest" do
      system "make", "install"
      bin.install "cloudposse/htmltest"
    end
  end
end
