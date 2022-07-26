#!/bin/bash
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

yarn global add @ziglang/cli
whereis zig
cargo install cargo-lambda
# mkdir -p netlify/functions
# cargo build --release
cargo lambda build --release
# cp target/lambda netlify/functions
