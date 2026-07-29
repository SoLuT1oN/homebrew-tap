cask "capcap" do
  version "1.6.18"
  sha256 "084a97205105904033c8d2d5c3ec84e6e69348294c6f9ad6db7f76d41b39874c"

  url "https://github.com/realskyrin/capcap/releases/download/release-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Lightweight native menu bar screenshot tool"
  homepage "https://github.com/realskyrin/capcap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
