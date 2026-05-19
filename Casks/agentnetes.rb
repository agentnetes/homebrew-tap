cask "agentnetes" do
  arch arm: "arm64", intel: "x64"

  version "2.6.0"
  sha256 arm:   "fecc395096b936667ff68263b1692a499830887b8c029fc0e8368e2cb760b698",
         intel: "88b6c3f602d14337c73a9608ddbce9f552b6a6987d5de7f4d8d8bf5503c3ddda"

  url "https://updates.agentnetes.io/stable/Agentnetes-#{version}-#{arch}.dmg"
  name "Agentnetes"
  desc "Kubernetes-style declarative orchestration for AI agent fleets"
  homepage "https://agentnetes.io/"

  auto_updates true # in-app updater handles upgrades after install

  app "Agentnetes.app"

  # Symlink the CLI bundled inside the .app to PATH. The CLI is the
  # primary product; the .app is the desktop shell. After this line,
  # `brew install --cask agentnetes/tap/agentnetes` puts both the
  # Electron app at /Applications and `a8s` on PATH in one command —
  # no separate formula needed.
  binary "#{appdir}/Agentnetes.app/Contents/Resources/app.asar.unpacked/bin/a8s"

  zap trash: [
    "~/Library/Application Support/Agentnetes",
    "~/Library/Application Support/a8s-mission-control",
    "~/Library/Logs/Agentnetes",
    "~/Library/Logs/A8s Mission Control",
    "~/Library/Preferences/io.agentnetes.desktop.plist",
    "~/Library/Preferences/io.agentnetes.mission-control.plist",
    "~/Library/Saved Application State/io.agentnetes.desktop.savedState",
    "~/Library/Saved Application State/io.agentnetes.mission-control.savedState",
  ]
end
