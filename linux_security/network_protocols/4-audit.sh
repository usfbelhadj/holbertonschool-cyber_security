#!/bin/bash

files=(/etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf)

grep -hEv '^(#|$)' "${files[@]}" 2>/dev/null