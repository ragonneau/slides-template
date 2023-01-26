#!/usr/bin/env bash

if [[ -z "$GITHUB_SERVER_URL" || -z "$GITHUB_REPOSITORY" ]]; then
    git ls-remote --get-url | sed "s/\.git$/\//"
else
    echo "$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/"
fi
