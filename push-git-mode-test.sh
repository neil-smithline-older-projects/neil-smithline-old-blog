#!/bin/sh

cd $(dirname $0)

git add orgmode-test.org && git commit -m "updating orgmode-test.org" && git push