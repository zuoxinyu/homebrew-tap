cask "xrose" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "1d2a6a8b095d3cda35af6eaaa41acaea865d6e08d9e602ecd18ab5552f17ff8a",
         intel: "7ce27ad32f72e95bc9639bb0c7e9695dfe08c1e9c74f0c517f7ef21c62035ddd"

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
