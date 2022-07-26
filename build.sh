#!/bin/bash
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

cargo build --release
cp target/release/hello netlify/functions/hello/
