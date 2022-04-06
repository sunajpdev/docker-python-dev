#!/bin/bash
if [ ! -e '/check' ]; then
  touch /check
  # 初回
  echo 'nameserver 8.8.8.8' > /etc/resolv.conf
  bash
else
  # 2回目移行
  bash
fi