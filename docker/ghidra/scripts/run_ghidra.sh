#!/bin/bash

/usr/bin/ghidra
tail -f --pid=$(pgrep -n -f ghidra.GhidraClassLoader) /dev/null
