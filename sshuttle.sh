#!/bin/bash
echo "Shuttleing docker hub"
nohup sshuttle -r ubuntu@tokyo.vocinno.com 54.88.164.232/32 &
