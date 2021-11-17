class RainbowText < Formula
  desc "Tasty rainbows for your terminal! (lolcat clone)"
  url "https://github.com/cloudposse/packages.git"
  version "1.1.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/rainbow-text" do
      system "make", "install"
      bin.install "cloudposse/rainbow-text"
    end
  end
end
