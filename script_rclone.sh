#!/bin/bash

while true; do
  rclone rc --rc-addr=localhost:5573 vfs/refresh recursive=true

  sleep 5
done
