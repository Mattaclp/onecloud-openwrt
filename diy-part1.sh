#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# change feeds.conf.default
rm -rf feeds.conf.default
wget https://github.com/Mattaclp/NewLEDE/raw/refs/heads/main/1806feeds.conf.default/feeds.conf.default

# add passwall
sed -i '$a src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' feeds.conf.default
sed -i '$a src-git passwall https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' feeds.conf.default

# add helloworld
#git clone https://github.com/fw876/helloworld.git package/helloworld
sed -i '$a src-git helloworld https://github.com/fw876/helloworld.git;master' feeds.conf.default

git clone -b dev https://github.com/vernesong/OpenClash.git package/lean/OpenClash
mv package/lean/OpenClash/luci-app-openclash package/lean/
rm -rf package/lean/OpenClash

