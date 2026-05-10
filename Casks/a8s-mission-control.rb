cask "a8s-mission-control" do
  arch arm: "arm64", intel: "x64"

  version "2.2.2"
  sha256 arm:   "91e1e0f736f9c0958d939ade3dc9fc304295fc372174615c6eb0e70568e063ed",
         intel: "3bd9ec3989d7dff9579d8722c2e22f6d2f552f4435249600077faa353ef9bc0c"

  url "https://updates.agentnetes.io/stable/A8s.Mission.Control-#{version}-#{arch}.dmg"
  name "A8s Mission Control"
  desc "Agent operations control plane for code-blaze missions"
  homepage "https://agentnetes.io/"

  auto_updates true # in-app updater handles upgrades after install

  app "A8s Mission Control.app"

  zap trash: [
    "~/Library/Application Support/a8s-mission-control",
    "~/Library/Logs/A8s Mission Control",
    "~/Library/Preferences/io.agentnetes.mission-control.plist",
    "~/Library/Saved Application State/io.agentnetes.mission-control.savedState",
  ]
end
