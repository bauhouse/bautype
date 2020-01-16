#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e12729ef8a3e4001bf069dc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e12729ef8a3e4001bf069dc
curl -s -X POST https://api.stackbit.com/project/5e12729ef8a3e4001bf069dc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e12729ef8a3e4001bf069dc/webhook/build/publish > /dev/null
