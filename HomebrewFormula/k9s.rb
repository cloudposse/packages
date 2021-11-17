class K9s < Formula
  desc "Kubernetes CLI To Manage Your Clusters In Style!"
  homepage "https://k9scli.io/"
  url "https://github.com/derailed/k9s.git",
      tag:      "v0.25.3",
      revision: "ffab2151ee8ba3bcde31db4a1296d4221876f2e4"
  license "Apache-2.0"
  head "https://github.com/derailed/k9s.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4d5331adc75aafc7ca049c57fea776bb1fdb53b2352ca37339c91a726c105325"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e25cad577cd4cf192b506293256732fc3f3b48844fd4f9a0bbe70b6b856e9b6f"
    sha256 cellar: :any_skip_relocation, monterey:       "b7d1ecd83e8459d16b205964688c0dcfb380afbd428bfb7d7100c7acd93b3ec5"
    sha256 cellar: :any_skip_relocation, big_sur:        "f122a8d944bc1945c733c5da970a56d235d5f3066c9ce1dd252990cd9be6f244"
    sha256 cellar: :any_skip_relocation, catalina:       "75ef6a95362b606a4c46c43c662cd4b26b4377a8491d9abc75fa4630adcd854d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9d6177e6f80ffe4f29474d7b7cb6a7c42de36e2e216a24ab91718b5a9693c20d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags",
             "-s -w -X github.com/derailed/k9s/cmd.version=#{version}
             -X github.com/derailed/k9s/cmd.commit=#{Utils.git_head}",
             *std_go_args

    bash_output = Utils.safe_popen_read(bin/"k9s", "completion", "bash")
    (bash_completion/"k9s").write bash_output

    zsh_output = Utils.safe_popen_read(bin/"k9s", "completion", "zsh")
    (zsh_completion/"_k9s").write zsh_output

    fish_output = Utils.safe_popen_read(bin/"k9s", "completion", "fish")
    (fish_completion/"k9s.fish").write fish_output
  end

  test do
    assert_match "K9s is a CLI to view and manage your Kubernetes clusters.",
                 shell_output("#{bin}/k9s --help")
  end
end
