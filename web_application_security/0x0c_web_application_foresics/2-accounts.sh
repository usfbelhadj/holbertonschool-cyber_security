#!/bin/bash

# Log file
tail -n 1000 auth.log > 1000.log
log_file=1000.log


failed_passwords=$(grep 'Failed password' "$log_file")
accepted_passwords=$(grep 'Accepted password' "$log_file")

# Get unique users with failed passwords
failed_users=$(echo "$failed_passwords" | awk '{print $9}' | sort | uniq)

# Get unique users with accepted passwords
accepted_users=$(echo "$accepted_passwords" | awk '{print $9}' | sort | uniq)

# Find users that had both failed and accepted passwords
common_users=$(comm -12 <(echo "$failed_users") <(echo "$accepted_users"))

# Print users with failed and accepted passwords
echo "$common_users"