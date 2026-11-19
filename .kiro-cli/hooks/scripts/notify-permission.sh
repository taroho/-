#!/bin/bash
# 権限確認待ち時: 柔らかい通知音を再生する(Windows標準サウンド)
powershell.exe -NoProfile -Command '(New-Object Media.SoundPlayer "C:\Windows\Media\ding.wav").PlaySync()' >/dev/null 2>&1
