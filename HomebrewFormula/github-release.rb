class GithubRelease < Formula
  desc "Commandline app to create and edit releases on Github (and upload artifacts)"
  url "https://github.com/cloudposse/packages.git"
  version "0.10.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/github-release" do
      system "make", "install"
      bin.install "cloudposse/github-release"
    end
  end
end
