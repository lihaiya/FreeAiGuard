#!/bin/bash

# FreeAiGuard 安装脚本
# 
# 本脚本用于安装和配置 FreeAiGuard 开源智能运维哨兵系统
# 作者: Haiya Li
# 微信：freeaiclub
# 电话：+86-15700176897
# 版本: v1.0.0-beta.1
# 支持系统: Linux x86_64
# 
# 使用方法:
# 1. 确保有 root 权限运行此脚本
# 2. 运行脚本后根据菜单选择相应操作
# 3. 默认安装路径为 /opt/freeaiguard
#
# 技术支持: https://freeaiguard.com

basePath=$(cd "$(dirname "$0")"; pwd)
cd ${basePath}

#init
initVar() {
    installType='yum -y install'
    removeType='yum -y remove'
    upgrade="yum -y update"
    echoType='echo -e'
    version='v1.0.0-beta.1'
}
initVar
export LANG=en_US.UTF-8

#the color of font
echoColor() {
    case $1 in
    "red")
        # shellcheck disable=SC2154
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
    "skyBlue")
        ${echoType} "\033[1;36m${printN}$2 \033[0m"
        ;;
    "green")
        ${echoType} "\033[32m${printN}$2 \033[0m"
        ;;
    "white")
        ${echoType} "\033[37m${printN}$2 \033[0m"
        ;;
    "magenta")
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
    "yellow")
        ${echoType} "\033[33m${printN}$2 \033[0m"
        ;;
    esac
}


#start
menu() {
    clear
    echoColor green "==========================================="
    echoColor green "| FreeAiGuard ${version} Install Script"
    echoColor green "| Author: Haiya Li"
    echoColor green "| WeChat: freeaiclub"
    echoColor green "| Phone:  +86-15700176897"
    echoColor green "| Website: freeaiguard.com"
    echoColor green "===========================================\n"
    echoColor white "Press 1 : Install and run freeaiguard"
    echoColor white "Press 0 : Exit"

    while [ 1 ]; do
        read -r -p "Input: " selectMenu

        case ${selectMenu} in
        1):
            serverInstall
            ;;
        0)
            exitInstall
            ;;
        *)
            continue
            ;;
        esac
        break
    done
}

serverInstall() {
    if [ $(uname -s) = 'Linux' ] && [ $(uname -m) = 'x86_64' ] && [ $(getconf LONG_BIT) = '64' ]; then
        curl -k https://github.com/lihaiya/FreeAiGuard/releases/releases/download/v1.0.0-beta.1/freeaiguard--${version}-linux-amd64.tar.gz -o /opt/freeaiguard-${version}-linux-amd64.tar.gz
    else
        echoColor red "No OS version is detected. Please refer to https://freeaiguard.com for manual installation\n" && exit 1
    fi

    mkdir -p /opt/freeaiguard
    tar -zxvf /opt/freeaiguard-${version}*.tgz -C freeaiguard
    cd /opt/freeaiguard
    sudo /bin/bash ./install.sh
}

exitInstall() {
    exit 1
}

# start
menu
