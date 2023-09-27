#!/bin/bash
# read-menu: amenu driven system information program
clear
echo "
Please Select:


    1. Display System Information
    2. Display Disk Space
    3. Display Home Space Utilization
    0. Quit
"
read -p "Enter selection [0-3] > "

if [[ $REPLY =~ ^[0-3]$ ]]; then
    echo "That's right."
    if [[ $REPLY == 0 ]]; then #正常终止
        echo "Program terminated."
        exit
    fi
    if [[ $REPLY == 1 ]]; then #系统负载
        echo "Hostname: $HOSTNAME"
        uptime
        exit
    fi
    if [[ $REPLY == 2 ]];then #磁盘信息
      df -h
      exit
    fi
    if [[ $REPLY == 3 ]]; then #用户目录使用情况
        if [[ $(id -u) -eq 0 ]]; then #如果是超级用户
            echo "Home Space Utilization (All Users)"
            du -sh /home/*
        else
          echo "Home Space Utilization ($USER)"
          du -sh $HOME
        fi
    fi
    exit
else
  echo "Invalid entry." >&2
  exit 1
fi