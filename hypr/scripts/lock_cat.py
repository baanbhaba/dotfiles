#!/usr/bin/env python3
import time

step = int(time.time()) % 4

frames = [
    # 0. Idle Eyes
    "  /\\_/\\  \n ( o.o ) \n  > ^ <  ",

    # 1. Happy Eyes
    "  /\\_/\\  \n ( ^.^ ) \n  > ^ <  ",

    # 2. Sleeping Loaf
    "  /\\_/\\  \n ( -.- ) \n  (___)z ",

    # 3. Curious Winking
    "  /\\_/\\  \n ( o.- ) \n  > ^ <  "
]

print(frames[step])
