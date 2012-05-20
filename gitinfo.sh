#!/bin/bash - 
#===============================================================================
#
#          FILE:  gitinfo.sh
# 
#         USAGE:  ./gitinfo.sh 
# 
#	DESCRIPTION:  
#		 AUTHOR: Duane Johnson
#		  EMAIL: duane.johnson@gmail.com
#		   DATE: 2008 Jun 12
#		LICENSE: MIT
#===============================================================================

set -o nounset                              # Treat unset variables as an error

pushd . >/dev/null

# Find base of git directory
while [ ! -d .git ] && [ ! `pwd` = "/" ]; do cd ..; done

# Show various information about this git directory
if [ -d .git ]; then
	echo "== Remote URL: `git remote -v`"

	echo "== Remote Branches: "
	git branch -r
	echo

	echo "== Local Branches:"
	git branch
	echo

	echo "== Configuration (.git/config)"
	cat .git/config
	echo

	echo "== Most Recent Commit"
	git --no-pager log --pretty=format'%h was %an, %ar: %s' --graph 
	echo

	echo "Type 'git log' for more commits, or 'git show' for full commit details."
else
	echo "Not a git repository."
fi

popd >/dev/null
