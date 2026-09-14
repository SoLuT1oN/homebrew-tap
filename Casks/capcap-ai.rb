cask "capcap-ai" do
  version "1.7.13-ai.3"
  sha256 "330ebded8e647a4443a28504c891a34cafe2782502ccd9fd13685f1dba371b46"

  url "https://github.com/SoLuT1oN/capcap/releases/download/custom-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Customized capcap with AI Calendar integration"
  homepage "https://github.com/SoLuT1oN/capcap"

  conflicts_with cask: [
    "realskyrin/tap/capcap",
    "solut1on/tap/capcap",
  ]
  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
