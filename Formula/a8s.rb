class A8s < Formula
  desc "Agentnetes Mission Control CLI — Kubernetes-style declarative orchestration for AI agent fleets"
  homepage "https://agentnetes.io"
  version "2.2.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-darwin-arm64.tar.gz"
      sha256 "9aa5af3d8dc9f2b3005d1a5bc8194cf9144a2c84a498418613a8bbbcad35ff0d"
    else
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-darwin-amd64.tar.gz"
      sha256 "66eef1341a9dc78306a89238d68472ca04db7085bfbe472a59841d94d79f7696"
    end
  end

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-linux-arm64.tar.gz"
      sha256 "f7de81d250423566d3fbf5400cd828e51c3c9d15c825293d268c335ef113fe63"
    else
      url "https://updates.agentnetes.io/cli/v#{version}/a8s-linux-amd64.tar.gz"
      sha256 "9cd96ac00b634970a96843e4fc9911f6b2588383381c47dc7fa66f77be0cef1c"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "a8s-#{os}-#{arch}" => "a8s"
    generate_completions_from_executable(bin/"a8s", "completion")
  end

  test do
    assert_match "a8s", shell_output("#{bin}/a8s version")
  end
end
