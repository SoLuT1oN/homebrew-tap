cask "clipcap" do
  version "1.8.21"
  sha256 "589aabe1c04378e270a26e7ecd775364588e07ecca87bdc2d5d3adc27921645f"

  url "https://github.com/realskyrin/clipcap/releases/download/release-v#{version}/clipcap-#{version}-macos.zip"
  name "clipcap"
  desc "Permission-light Mac image annotation tool"
  homepage "https://github.com/realskyrin/clipcap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "clipcap.app"

  uninstall quit: "cn.skyrin.clipcap"

  zap trash: "~/Library/Preferences/cn.skyrin.clipcap.plist"
end
