#!/bin/bash
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

# which zig || yarn global add @ziglang/cli
# # /opt/buildhome/.yarn/bin/zig
# which cargo-zigbuild || cargo install cargo-zigbuild
mkdir -p netlify/functions
# cargo zigbuild --target x86_64-unknown-linux-gnu.2.26 --release
cargo build --target=x86_64-unknown-linux-musl --release
# add copy commands as you add functions
# cp target/x86_64-unknown-linux-gnu/release/hello netlify/functions/
# cp target/x86_64-unknown-linux-gnu/release/dad-joke netlify/functions/
cp target/x86_64-unknown-linux-musl/release/hello netlify/functions/
cp target/x86_64-unknown-linux-musl/release/dad-joke netlify/functions/

# mkdir -p netlify/functions
# cargo build --release
# # add copy commands as you add functions
# cp target/x86_64-unknown-linux-musl/release/hello netlify/functions/
# cp target/x86_64-unknown-linux-musl/release/dad-joke netlify/functions/
