cask "a8s-mission-control" do
  arch arm: "arm64", intel: "x64"

  version "2.2.3"
  sha256 arm:   "5ec2b2a80f4115e61ee218bde5720100821136173eba251d4a62849604f53f44",
         intel: "1ca0f2b8cc9d40819f6f9f9ed4c0b9ea1af902e3a0b6f4927718939b8cef579d"

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
