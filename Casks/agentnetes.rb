cask "agentnetes" do
  arch arm: "arm64", intel: "x64"

  version "2.5.7"
  sha256 arm:   "266473282e86798cfebf8475c4bb1c532d4589826855b2aa0def33f3f851a0a8",
         intel: "17005b4d7f390ea56cb23f2ea32ddc47fb45ef9c0bc4b598754f223d1bcc6ec9"

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
