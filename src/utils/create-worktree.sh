#!/bin/bash
if [ $# -eq 0]; then
   echo "Error: Worktree name needed!"
   return 1
fi
ARGUMENT=$1
WORKTREE_PATH="../${폴더이름}$ARGUMENT"
# create worktree, and if successful, change directory
if git worktree add "$WORKTREE_PATH"; then
   echo "Worktree added successfully: $WORKTREE_PATH"
   cd "WORKTREE_PATH" || return 1
   echo "Directory change succeeded: $(pwd)"
   claude
else
   echo "Worktree creation failed"
   return 1