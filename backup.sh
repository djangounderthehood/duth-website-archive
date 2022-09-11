#!/bin/bash
set -euo pipefail

rm -rf _build
mkdir _build

cd _build

# Mirror the whole 2016 website, including some images stored in AWS
wget \
  --convert-links \
  --html-extension \
  --no-check-certificate \
  --no-parent \
  --page-requisites \
  --recursive \
  --user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36' \
  -w 0 \
  --restrict-file-names=windows \
  https://djangounderthehood.herokuapp.com/


cd ..

mkdir -p docs
cp -r _build/djangounderthehood.herokuapp.com/* docs/
