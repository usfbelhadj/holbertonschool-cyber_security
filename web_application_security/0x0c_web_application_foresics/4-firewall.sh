#!/bin/bash
grep 'iptables' auth.log | grep 'ACCEPT' | wc -l