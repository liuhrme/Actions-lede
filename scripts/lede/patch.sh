#!/bin/bash

#创建所需文件夹
mkdir -p package/lean/r8152/patches
mkdir -p target/linux/rockchip/files/drivers/phy/rockchip

#更改默认地址为192.168.8.1
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

#更改r8152默认驱动
#sed -i 's/kmod-usb-net-rtl8152/kmod-usb-net-rtl8152-vendor/g' target/linux/rockchip/image/armv8.mk

#添加内核配置
sed -i '$a CONFIG_PHY_ROCKCHIP_INNO_USB3=y' target/linux/rockchip/armv8/config-5.15

#删除feeds中自带的smartdns
rm -rf ./feeds/packages/net/smartdns

#克隆插件
rm -rf feeds/ssrp/ipt2socks
#adguardhome
git clone -b main https://github.com/XiaoBinin/luci-app-adguardhome.git package/adg
#smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lucismartdns
git clone -b master https://github.com/pymumu/smartdns.git package/smartdns
#ssrp
#git clone -b master https://github.com/fw876/helloworld.git package/ssrp
#passwall
git clone -b luci --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/pw
git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/pwages
#passwall2
git clone -b main https://github.com/xiaorouji/openwrt-passwall2.git package/pw2
#mosdns
git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git package/mosdns
#openclash
git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git package/opclash
