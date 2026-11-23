cask "xrose" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.1"
  sha256 arm:   "a1583b08f730a7f4333551fafc89df7f88d1176607cd29f4bd320c6349b0abe6",
         intel: "23bcdd30ecb2a19f8edddcf837ab243082ce0c2e002484b13c4bda033f16a192"

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
