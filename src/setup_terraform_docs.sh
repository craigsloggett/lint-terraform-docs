#!/bin/sh

set -eu

os="$(uname -s | tr '[:upper:]' '[:lower:]')"
arch="$(uname -m)"

case "${arch}" in
  x86_64) arch="amd64" ;;
  aarch64 | arm64) arch="arm64" ;;
  *)
    echo "Unsupported architecture: ${arch}"
    exit 1
    ;;
esac

github_releases_url="https://github.com/terraform-docs/terraform-docs/releases/download"
download_url="${github_releases_url}/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${os}-${arch}.tar.gz"

echo "Installing terraform-docs v${TERRAFORM_DOCS_VERSION}"
temp_dir=$(mktemp -d)
curl -sSL "${download_url}" | tar -xz -C "${temp_dir}" terraform-docs
install -m 0755 "${temp_dir}/terraform-docs" /usr/local/bin/terraform-docs
terraform-docs --version
