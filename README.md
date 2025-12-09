# lint-terraform-docs

A composite action for linting Terraform module documentation.

## Usage

```yaml
name: Lint

on: pull_request

permissions:
  contents: read

jobs:
  terraform-docs:
    name: Terraform Docs
    runs-on: ubuntu-24.04
    steps:
      - name: Checkout
        uses: actions/checkout@v6

      - name: Lint Terraform Module Documentation
        uses: craigsloggett-lab/lint-terraform-docs@v1
```
