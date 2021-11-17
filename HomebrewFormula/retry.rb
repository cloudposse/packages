class Retry < Formula
  desc "♻️ Functional mechanism based on channels to perform actions repetitively until successful."
  url "https://github.com/cloudposse/packages.git"
  version "3.3.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/retry" do
      system "make", "install"
      bin.install "cloudposse/retry"
    end
  end
end
