# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two processes concurrently try to update a shared resource (a counter in a file) without proper synchronization, leading to unpredictable and incorrect results.  The solution demonstrates how to prevent this issue using a lock file.