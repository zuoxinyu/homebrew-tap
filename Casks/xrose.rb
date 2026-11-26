cask "xrose" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.2"
  sha256 arm:   "724d6a68c4eb556bfe1c165fef9d123ff230a9603f1c1ec555b34222c995df06",
         intel: "50521544d3e5b99fc694785f47ff66dd5bdea58cfbb23d50d7d4cf8941faf220"

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
