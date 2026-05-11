cask "agentnetes" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "366cb5a4cf755a33541814bbfa25544c27286ce58823a3c4fd6480cd053c8569",
         intel: "eef1ab841e0a953b0c972f645bfc79d7fb46bb00d72b4d9ed62d0faf541cfd74"

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
