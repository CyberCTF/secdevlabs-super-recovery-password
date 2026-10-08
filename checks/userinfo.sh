#!/bin/sh
# The recovery flow's userinfo route answers differently for a known login (admin, created by
# the API at start) than for an unknown one.
set -e
known=$(curl -sS -H 'Content-Type: application/json' -d '{"login":"admin"}' http://api:3000/userinfo)
unknown=$(curl -sS -H 'Content-Type: application/json' -d "{\"login\":\"nobody$$\"}" http://api:3000/userinfo)
echo "$known" | grep -q 'firstQuestion'
[ "$known" != "$unknown" ]
