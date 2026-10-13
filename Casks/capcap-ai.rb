cask "capcap-ai" do
  version "1.7.19-ai.1"
  sha256 "4aeb949b0cef99f863d2045b0ac02fff20a032693aca785c4ee0e889539ee60c"

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
