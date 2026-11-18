cask "xrose" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "4d81c9109b65835564b7fef6b7fb3d0c159f850c7db115667740dfef8560da40",
         intel: "dae4e3522da9bd90132238223034cea5e6a30f01e40beeda89593a5755bd5d4f"

  url "https://github.com/zuoxinyu/xrose/releases/download/v#{version}/Xrose-#{version}-macos-#{arch}-full.dmg"
  name "Xrose"
  desc "Xray and sing-box desktop client with EasyTier and Tailscale mesh"
  homepage "https://github.com/zuoxinyu/xrose"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Xrose.app"
  binary "#{appdir}/Xrose.app/Contents/Resources/xrose-seed/xrose-cli"

  uninstall quit: "io.xrose.Xrose"

  zap trash: [
    "~/Library/Application Support/io.xrose.Xrose",
    "~/Library/Caches/io.xrose.Xrose",
    "~/Library/LaunchAgents/io.xrose.app.plist",
    "~/Library/Preferences/io.xrose.Xrose.plist",
  ]

  caveats <<~EOS
    If macOS Gatekeeper blocks first launch on unnotarized builds, open System Settings -> Privacy & Security and click "Open Anyway".
    If you previously installed the privileged helper, remove it via "xrose-cli helper uninstall" before zapping.
  EOS
end
