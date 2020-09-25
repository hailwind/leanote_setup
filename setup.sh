#!/bin/bash
useradd leanote
chown -R leanote:leanote ..
cp leanote /etc/default/
cp leanote.service /lib/systemd/system/
systemctl daemon-reload
