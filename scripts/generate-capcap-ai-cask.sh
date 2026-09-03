#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 4 ]] || [[ "$#" -gt 5 ]]; then
  echo "Usage: $0 <version> <sha256> <tag> <asset_name> [output_path]" >&2
  exit 1
fi

VERSION="$1"
SHA256="$2"
TAG="$3"
ASSET_NAME="$4"
OUTPUT_PATH="${5:-Casks/capcap-ai.rb}"

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+-ai\.[0-9]+$ ]]; then
  echo "Invalid capcap-ai version: $VERSION" >&2
  exit 1
fi

if [[ ! "$SHA256" =~ ^[0-9a-fA-F]{64}$ ]]; then
  echo "Invalid SHA256" >&2
  exit 1
fi

EXPECTED_TAG="custom-v${VERSION}"
EXPECTED_ASSET="capcap-${VERSION}-macos.zip"
NORMALIZED_SHA256="$(printf '%s' "$SHA256" | tr '[:upper:]' '[:lower:]')"
if [[ "$TAG" != "$EXPECTED_TAG" ]]; then
  echo "Tag must be $EXPECTED_TAG" >&2
  exit 1
fi

if [[ "$ASSET_NAME" != "$EXPECTED_ASSET" ]]; then
  echo "Asset name must be $EXPECTED_ASSET" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUTPUT_PATH")"

cat > "$OUTPUT_PATH" <<EOF
cask "capcap-ai" do
  version "${VERSION}"
  sha256 "${NORMALIZED_SHA256}"

  url "https://github.com/SoLuT1oN/capcap/releases/download/custom-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Customized capcap with AI Calendar integration"
  homepage "https://github.com/SoLuT1oN/capcap"

  conflicts_with cask: "capcap"
  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
EOF

echo "Generated $OUTPUT_PATH"
