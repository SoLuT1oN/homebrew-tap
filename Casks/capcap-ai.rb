cask "capcap-ai" do
  version "1.7.13-ai.1"
  sha256 "c0dc2eba153f76f452b340543e253544da8f67ba97cebd84c52d0bdd9c7fbc34"

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
