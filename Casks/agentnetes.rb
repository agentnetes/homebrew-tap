cask "agentnetes" do
  arch arm: "arm64", intel: "x64"

  version "2.5.2"
  sha256 arm:   "23834160a22c3ca1eff55f6700e8cb2da47a8c2217689f014f32c6b24d1dfa72",
         intel: "d79290479ec0c40a1a434b3455c5ed9870017b3d1d04c08e79dd989d3af1f1d8"

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
