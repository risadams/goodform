#!/bin/bash

# Git Hook for settinga task ID in the commit message (syntax based on Jira's PROJ-124 format)
# Adds to the top of your commit message `TASK_ID`, based on the prefix of the current branch `feature/AWG-562-add-linter`
# Example: `Add file -> `AWG-562 Add file

if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop test)
fi

COMMIT_FILE=$1
COMMIT_MSG=$(cat "$1")
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
TASK_ID_REGEX="[A-Z0-9]{1,10}-?[A-Z0-9]+"
TASK_ID_IN_CURRENT_BRANCH_NAME=$(echo "$CURRENT_BRANCH" | grep -Eo "$TASK_ID_REGEX")
TASK_ID_IN_COMMIT_MESSAGE=$(echo "$COMMIT_MSG" | grep -Eo "$TASK_ID_REGEX")

if [ -n "$TASK_ID_IN_COMMIT_MESSAGE" ]; then
  if [ "$TASK_ID_IN_COMMIT_MESSAGE" != "$TASK_ID_IN_CURRENT_BRANCH_NAME" ]; then
    echo "Error, your commit message TASK_ID='$TASK_ID_IN_COMMIT_MESSAGE' is not equal to current branch TASK_ID='$TASK_ID_IN_CURRENT_BRANCH_NAME'"
    exit 1
  fi
elif [ -n "$TASK_ID_IN_CURRENT_BRANCH_NAME" ]; then
  echo "$TASK_ID_IN_CURRENT_BRANCH_NAME $COMMIT_MSG" >"$COMMIT_FILE"
  echo "TASK ID '$TASK_ID_IN_CURRENT_BRANCH_NAME', matched in current branch name, prepended to commit message. (Use --no-verify to skip)"
fi
