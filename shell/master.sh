#!/usr/local/env bash

GH_REF="github.com/PasteUs/CDN.git"

bash -x shell/base.sh
cd push_dir

VERSION=`cat version.txt`
echo ${VERSION}
git tag ${VERSION} master
git tag latest master
bash shell/version.sh patch
git add version.txt
git commit -m "pushed from travis-ci `TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S'` [ci skip]"
git push https://${GH_TOKEN}@${GH_REF} master ${VERSION} latest
