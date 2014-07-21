#!/usr/bin/env bash

CPPLINT=externals/cpplint.py
CPPLINT_URL=http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py

if [[ ! -f $CPPLINT ]]; then
  curl $CPPLINT_URL > $CPPLINT
  chmod +x $CPPLINT
fi

$CPPLINT \
  --root=src \
  --linelength=85 \
  --filter=-legal/copyright,-readability/todo \
  $(find src/compiler -type f) \
  2>&1
