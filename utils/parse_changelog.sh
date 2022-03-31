#!/usr/bin/env bash

# Force simple / computer locale
LC_ALL=C

# Get latest git tag
latest_release="$(git describe --abbrev=0)"

# Get previous git tag
previous_release="$(git describe --abbrev=0 --tags $(git rev-list --tags --skip=1 --max-count=1))"

# If version has 0 at the end, it's a major or minor version, else it's a patch
# set which header tag we should be looking for
if [ ${latest_release: -1} == 0 ]
then
	latestHeaderTag='##'
else
	latestHeaderTag='###'
fi

# If version has 0 at the end, it's a major or minor version, else it's a patch
# set which header tag we should be looking for
if [ ${previous_release: -1} == 0 ]
then
	previousHeaderTag='##'
else
	previousHeaderTag='###'
fi

# Get and print changelog contents for latest changelog
CHANGELOG="$(awk "/${latestHeaderTag} \[${latest_release:1}/ {f=1} /${previousHeaderTag} \[${previous_release:1}/ {f=0} f" CHANGELOG.md)"

# Sanitise input
CHANGELOG="${CHANGELOG//'%'/'%25'}"
CHANGELOG="${CHANGELOG//$'\n'/'%0A'}"
CHANGELOG="${CHANGELOG//$'\r'/'%0D'}"

# Print changelog
echo "$CHANGELOG"

exit