cask "xrose" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "307155f1b210a9649fd07b99e0dba007c73120a4575630d2f609a9dec91501fa",
         intel: "bbd9ede2bf2f15aad878732846be423af5a9fb3baa36eb50b04b9dfc4d41b68d"

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
