cask "capcap-ai" do
  version "1.7.16-ai.1"
  sha256 "c9dda0eb76395327e63e14010dedd84c92172aa54d4a4f42c8943e771544fa0d"

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
