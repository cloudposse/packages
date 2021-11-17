class Githubcommenter < Formula
  desc "Command line utility for creating GitHub comments on Commits, Pull Request Reviews or Issues"
  url "https://github.com/cloudposse/packages.git"
  version "0.9.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/github-commenter" do
      system "make", "install"
      bin.install "cloudposse/github-commenter"
    end
  end
end
