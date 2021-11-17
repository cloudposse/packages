class Fzf < Formula
  desc "A command-line fuzzy finder"
  url "https://github.com/cloudposse/packages.git"
  version "0.23.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/fzf" do
      system "make", "install"
      bin.install "cloudposse/fzf"
    end
  end
end
