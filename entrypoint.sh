#!/bin/sh -l

set -e

if [ -z "$ACCESS_TOKEN" ]; then
    echo "ACCESS_TOKEN is required to run commands with the code-push-standlone cli"
    exit 126
fi

if [ -z "$CODEPUSH_SERVER_URL" ]; then
    echo "CODEPUSH_SERVER_URL is required to run commands with the code-push-standlone cli"
    exit 126
fi

sh -c "code-push-standalone login $CODEPUSH_SERVER_URL --accessKey $ACCESS_TOKEN"
sh -c "code-push-standalone $*"