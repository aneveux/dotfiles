#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WARN_MSG="# Generated file, do not edit!!!"

if test -f "$HOME/.gitconfig"; then
  if test -f $BASEDIR/local/gitconfig_cksum; then
    expected=$(cat $BASEDIR/local/gitconfig_cksum)
    real=$(cksum $HOME/.gitconfig)
    if test "$expected" != "$real"; then
      echo "The file exists and checksum doesn't match" >&2
      exit 1
    fi
  else
    if test "$(head -n1 "$HOME/.gitconfig")" != "$WARN_MSG"; then
      echo "The file exists and doesn't seems generated, abort generation" >&2
      exit 1
    fi
  fi
fi

test -f "$BASEDIR/local/gitconfig_user" && (echo -e "$WARN_MSG\n$WARN_MSG\n$WARN_MSG\n" && cat "$BASEDIR/local/gitconfig_user" "$BASEDIR/git/gitconfig" && echo -e "\n$WARN_MSG\n$WARN_MSG\n$WARN_MSG") > $HOME/.gitconfig
cksum $HOME/.gitconfig > $BASEDIR/local/gitconfig_cksum