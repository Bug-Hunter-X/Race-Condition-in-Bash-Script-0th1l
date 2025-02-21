#!/bin/bash

# This script demonstrates a solution for the race condition bug.

# Create a file that will be used for synchronization
sync_file="sync"

# Create a file with some initial value
value=0
echo $value > output.txt

# First process
(while true; do
  # Wait for the lock file
  while [ -f $sync_file ]; do
    sleep 0.01
  done
  # Create the lock file
touch $sync_file
  # Read the value from output.txt
  old_value=$(cat output.txt)
  # Increment the value
  new_value=$((old_value + 1))
  # Wait for 1 second (simulating some work)
  sleep 1
  # Write the new value
  echo $new_value > output.txt
  # Delete the lock file
  rm $sync_file
  sleep 1
done)&