class Shellcheck < Formula
  desc "ShellCheck, a static analysis tool for shell scripts"
  url "https://github.com/cloudposse/packages.git"
  version "0.8.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/shellcheck" do
      system "make", "install"
      bin.install "cloudposse/shellcheck"
    end
  end
end
