cask "capcap-ai" do
  version "1.7.15-ai.1"
  sha256 "023bbd4472034a29b15b5cd836da2f2aca3d62428b3e0ab16f9f1505f934396b"

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
