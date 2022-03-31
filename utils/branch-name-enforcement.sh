#!/usr/bin/env bash

# Force simple / computer locale
LC_ALL=C

# Get local branch name
local_branch="$(git rev-parse --abbrev-ref HEAD)"

# Set acceptable branch prefixes
valid_branch_regex="(^(feature|chore|release|hotfix|refactor|test|ci)-.+)|^(main|develop)$"

# Define error message
message="There is something wrong with your branch name. Branch names in this project must adhere to this contract: $valid_branch_regex. Your commit will be rejected. You should rename your branch to a valid name and try again."

# If local branch name is invalid
if [[ ! $local_branch =~ $valid_branch_regex ]]
then
	# Output error message
    echo "$message"
    exit 1
fi

exit