#!/usr/bin/env bash
set -ev

CONTAINER_RUN_EXTRA_OPTIONS=${CONTAINER_RUN_EXTRA_OPTIONS:=""}
CONTAINER_ENGINE=${CONTAINER_ENGINE:="docker"}

# ignore
# 1: links going back to help.github.com are rate-limited and can make this flaky
# 2: docsy autogenerated edit links to original markdown source, which will fail if the markdown file is new
${CONTAINER_ENGINE} run --rm -v $(pwd)/public:/target mtlynch/htmlproofer /target --ignore-empty-alt --ignore-status-codes 429 --allow-hash-href --no-check-external-hash --ignore-urls '/help.github.com/,/edit\/master\/.*\.md/,/tree\/master\/.*\.md/,/new\/master\/.*filename=change-me\.md/'
