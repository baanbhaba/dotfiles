#!/usr/bin/env python3
import time

step = int(time.time()) % 4

frames = [
    # 0. Idle Loaf
    """    |\\__/,|   (`\\
  _.|o o  |_   ) )
-(((---(((--------""",

    # 1. Blinking / Happy
    """    |\\__/,|   (`\\
  _.|^ ^  |_   ) )
-(((---(((--------""",

    # 2. Sleeping / Purring
    """    |\\__/,|   (`\\
  _.|- -  |_   ) )
-(((---(((---zzZ--""",

    # 3. Curious / Meow
    """    |\\__/,|   (`\\
  _.(* *  |_   ) )
-(((---(((---*meow"""
]

print(frames[step])
