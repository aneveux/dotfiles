#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WARN_MSG="# Generated file, do not edit!!!"

if test -f "$HOME/.ssh/config"; then
  if test -f $BASEDIR/local/sshconfig_cksum; then
    expected=$(cat $BASEDIR/local/sshconfig_cksum)
    real=$(cksum $HOME/.ssh/config)
    if test "$expected" != "$real"; then
      echo "The file exists and checksum doesn't match" >&2
      exit 1
    fi
  else
    if test "$(head -n1 "$HOME/.ssh/config")" != "$WARN_MSG"; then
      echo "The file exists and doesn't seems generated, abort generation" >&2
      exit 1
    fi
  fi
fi

test -f "$BASEDIR/local/sshconfig" && (echo -e "$WARN_MSG\n$WARN_MSG\n$WARN_MSG\n" && cat "$BASEDIR/ssh/config" "$BASEDIR/local/sshconfig" && echo -e "\n$WARN_MSG\n$WARN_MSG\n$WARN_MSG") > $HOME/.ssh/config
cksum $HOME/.ssh/config > $BASEDIR/local/sshconfig_cksum