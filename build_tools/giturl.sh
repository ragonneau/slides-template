#!/usr/bin/env bash

git ls-remote --get-url | sed "s/\.git$/\//"
