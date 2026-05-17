cask "agentnetes" do
  arch arm: "arm64", intel: "x64"

  version "2.5.8"
  sha256 arm:   "3c15de86fb18ad01250bdb62e3ba5a738b09727307ebe979d345b82832954dce",
         intel: "403c66c01cdc9b2f921bc65e90903375ba7f939ddaf1ff77561d7cc759a76515"

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
