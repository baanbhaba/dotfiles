#!/usr/bin/env bash
step=$(( $(date +%s) % 4 ))

case "$step" in
  0)
    printf "   |\\__/,|   (\\`\n"
    printf " _.|o o  |_   ) )\n"
    printf "-(((---(((------- "
    ;;
  1)
    printf "   |\\__/,|   (\\`\n"
    printf " _.|^ ^  |_   ) )\n"
    printf "-(((---(((------- "
    ;;
  2)
    printf "   |\\__/,|   (\\`\n"
    printf " _.|- -  |_   ) )\n"
    printf "-(((---(((---zzZ- "
    ;;
  3)
    printf "   |\\__/,|   (\\`\n"
    printf " _.(* *  |_   ) )\n"
    printf "-(((---(((---*meow"
    ;;
esac
