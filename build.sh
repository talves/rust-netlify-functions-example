#!/bin/bash
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

mkdir -p netlify/functions
cargo build --target=x86_64-unknown-linux-musl --release
# add copy commands as you add functions
cp target/x86_64-unknown-linux-musl/release/hello netlify/functions/
cp target/x86_64-unknown-linux-musl/release/dad-joke netlify/functions/

