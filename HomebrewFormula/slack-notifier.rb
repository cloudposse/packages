class SlackNotifier < Formula
  desc "Command line utility to send messages with attachments to Slack channels via Incoming Webhooks"
  url "https://github.com/cloudposse/packages.git"
  version "0.4.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/slack-notifier" do
      system "make", "install"
      bin.install "cloudposse/slack-notifier"
    end
  end
end
