#!/bin/bash
# 回答完了時: 柔らかい通知音を再生する(Windows標準サウンド)
powershell.exe -NoProfile -Command '(New-Object Media.SoundPlayer "C:\Windows\Media\chimes.wav").PlaySync()' >/dev/null 2>&1
