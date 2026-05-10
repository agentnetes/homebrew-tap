class A8s < Formula
  desc "Agentnetes Mission Control CLI — Kubernetes-style declarative orchestration for AI agent fleets"
  homepage "https://agentnetes.io"
  version "2.2.3"
  license "Apache-2.0"

  # Tarballs are mirrored to Cloudflare R2 (updates.agentnetes.io/cli/...)
  # because agentnetes/mission-control is a private GitHub repo and the
  # release-asset URLs require auth. R2 paths are public-read.
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-darwin-arm64.tar.gz"
      sha256 "56531bae1cdfbd65722bf6632c16d99bd5529f7b83fa35f4cb5e868fb70d15c0"
    else
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-darwin-amd64.tar.gz"
      sha256 "ef58ba13f91686ec6522e050bebccc9ad64c998819396f00ca724627af211cc7"
    end
  end

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-linux-arm64.tar.gz"
      sha256 "ec450b8a11e5ea7cb005d5e903007e4bc0edac5c8a480ff8281f6ffb06e16f43"
    else
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-linux-amd64.tar.gz"
      sha256 "678dfe7241760a67fb2f2ced7149c36d30f36ebed1e00deb09993b19005e1a5e"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "a8s-#{os}-#{arch}" => "a8s"

    # Generate and install shell completions during brew install. The
    # `a8s completion <shell>` subcommand prints cobra-generated scripts
    # for bash, zsh, and fish; Homebrew drops them into the right prefix
    # dirs so users get tab-completion automatically after install.
    generate_completions_from_executable(bin/"a8s", "completion")
  end

  test do
    assert_match "a8s", shell_output("#{bin}/a8s version")
  end
end
