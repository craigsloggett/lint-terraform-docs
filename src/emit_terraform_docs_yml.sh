#!/bin/sh

set -eu

# Check if a terraform-docs configuration already exists in the workspace.
for file in \
  .terraform-docs.yml \
  .terraform-docs.yaml \
  .config/terraform-docs.yml \
  .config/terraform-docs.yaml; do
  if [ -f "${file}" ]; then
    echo "Found existing terraform-docs config: ${file}"
    exit 0
  fi
done

# No existing config found — emit the default.
echo "No terraform-docs config found, emitting default .terraform-docs.yml"

cat >.terraform-docs.yml <<'EOF'
formatter: markdown table

recursive:
  enabled: false

content: |-
  {{ .Requirements }}

  {{ .Providers }}

  {{ .Modules }}

  {{ .Inputs }}

  {{ .Resources }}

  {{ .Outputs }}

output:
  file: README.md
  mode: inject

settings:
  lockfile: false
EOF
