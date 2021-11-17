class Githubstatusupdater < Formula
  desc "Command line utility for updating GitHub commit statuses and enabling required status checks for pull requests"
  url "https://github.com/cloudposse/packages.git"
  version "0.6.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/github-status-updater" do
      system "make", "install"
      bin.install "cloudposse/github-status-updater"
    end
  end
end
