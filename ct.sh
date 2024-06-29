#!/usr/bin/env bash

set -euo pipefail

export RUST_BACKTRACE=1

platforms=("x86_64-fortanix-unknown-sgx" "x86_64-unknown-linux-gnu")

for platform in "${platforms[@]}"; do
    echo "platform: $platform"
    echo ""
    cargo test --target  ${platform}
    cargo test --features "net,os-poll" --target  ${platform}
    cargo test --features "net,os-ext" --target  ${platform}
    cargo test --features "net,os-poll,os-ext" --target ${platform}
done
