class Misspell < Formula
  desc "Correct commonly misspelled English words in source files"
  url "https://github.com/cloudposse/packages.git"
  version "0.3.4"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/misspell" do
      system "make", "install"
      bin.install "cloudposse/misspell"
    end
  end
end
