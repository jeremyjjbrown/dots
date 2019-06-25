#!/bin/bash

url=$1
withoutProtocol="${url##*://}"
withDotGit="${HOME}/dev/src/${withoutProtocol}"
fullPath=${withDotGit%.*}

mkdir -p $fullPath
git clone $url $fullPath
cd $fullPath
