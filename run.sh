#!/bin/bash
echo " ================================================"
echo " __   __                       _  ___       _ "
echo " \ \ / / _  _  _ _   ___ __ _ (_)| _ ) ___ | |_ "
echo "  \ V / | || || ' \ |_ // _' || || _ \/ _ \|  _| "
echo "   |_|   \_,_||_||_|/__|\__,_||_||___/\___/ \__| "
echo ""
echo " ================================================"
echo " = Nora Script == 2023/03/15 == Plugins Include ="
echo " ================================================"
echo ""
echo ""

sleep 3

# 更新APT
apt update && apt list --upgradable
if [ $? != 0 ]; then 
echo "APT 更新失败,请检查APT状态"
exit 1
fi

# 安装 git, curl ,wget
apt install -y git curl
if [ $? != 0 ]; then
echo "APT 安装基础软件时遇到问题 (git/curl/wget)"
exit 2
fi

# 安装 nodejs v14
curl -sL https://deb.nodesource.com/setup_14.x | bash -
if [ $? != 0 ]; then
echo "curl 获取 Nodejs v14 安装脚本时遇到问题"
exit 3
fi
apt update && apt list --upgradable && apt install nodejs
if [ $? != 0 ]; then
echo "APT 安装Nodejs时遇到问题"
exit 4
fi

# 从gitee 克隆 yunzaibot
git clone --depth=1 -b main https://gitee.com/Le-niao/Yunzai-Bot.git
if [ $? != 0 ]; then
echo "Git 从Gitee克隆Yunzai-Bot时遇到问题"
exit 5
fi
cd Yunzai-Bot
npm install pnpm -g
if [ $? != 0 ]; then
echo "npm 安装 pnpm时遇到问题"
exit 6
fi
pnpm install -P
if [ $? != 0 ]; then
echo "pnpm 安装依赖时遇到问题"
exit 7
fi

# 安装puppeteer依赖
apt install -y libappindicator1 libappindicator3-1 libasound2 libatk1.0-0 libc6 libcairo2 libcap2 libcups2 libexpat1 libfontconfig1 libfreetype6 libglib2.0-0 libgtk2.0-0 libgtk-3-0 libpam0g libpango1.0-0 libpci3 libnss3 libpcre3 libpixman-1-0 libspeechd2 libstdc++6 libsqlite3-0 libuuid1 libwayland-egl1-mesa libx11-6 libx11-xcb1 libxau6 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 libxext6 libxfixes3 libxi6 libxinerama1 libxrandr2 libxrender1 libxtst6 zlib1g
if [ $? != 0 ]; then
echo "APT 安装 puppeteer依赖时遇到问题"
exit 8
fi


# 安装xiaoyao插件
while true; do
    read -p "是否安装 「 xiaoyao-cvs插件 」 : \"https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin\" (y/n):" xiaoyao
    case "$xiaoyao" in 
    y|Y)
        echo "安装 xiaoyao-cvs"
        #clone xiaoyao
        git clone https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin.git ./plugins/xiaoyao-cvs-plugin/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆xiaoyao插件时遇到问题"
        exit 9
        fi
        break
    ;;
    n|N)
        break
    ;;
    *)
        echo "请输入(y/n)来选择是否安装插件"
    ;;
    esac
done

# 安装喵喵插件
while true; do
    read -p "是否安装「 喵喵插件 miao-plugin 」: \"https://gitee.com/yoimiya-kokomi/miao-plugin\" (y/n):" miao
    case "$miao" in
    y|Y)
        echo "安装 miao-plugin"
        # clone miao plus
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆xiaoyao插件时遇到问题"
        exit 10
        fi
        # 安装miao plus依赖
        pnpm add image-size -w
        if [ $? != 0 ]; then
        echo "pnpm 安装 image-size 时遇到问题"
        exit 17
        fi

        break
    ;;
    n|N)
        break
    ;;
    esac
done

# 安装七圣召唤战绩查询
while true; do
    read -p "是否安装 「 七圣召唤战绩查询 」 : \"https://gitee.com/huangshx2001/call_of_seven_saints\" (y/n):" saint
    case "$saint" in
    y|Y)
        echo "安装 七圣召唤插件"
        # clone call of seven saints
        git clone https://gitee.com/huangshx2001/call_of_seven_saints.git ./plugins/call_of_seven_saints/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆七圣召唤战绩查询插件时遇到问题"
        exit 12
        fi
        break
    ;;
    n|N)
        break
    ;;
    esac
done

# 安装扩展插件
while true; do
    read -p "是否安装 「 扩展插件 」 : \"https://gitee.com/SmallK111407/expand-plugin\" (y/n):" expand
    case "$expand" in
    y|Y)
        echo "安装 扩展插件"
        #clone expand plugin
        git clone --depth=1 https://gitee.com/SmallK111407/expand-plugin.git ./plugins/expand-plugin/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆扩展插件时遇到问题"
        exit 13
        fi
        break
    ;;
    n|N)
        break
    ;;
    esac
done

# 安装小叶插件
while true; do
    read -p "是否安装 「 小叶插件 」 : \"https://gitee.com/xiaoye12123/xiaoye-plugin\" (y/n):" xiaoye
    case "$xiaoye" in
    y|Y)
        echo "安装 小叶插件"
        #clone xiaoye
        git clone https://gitee.com/xiaoye12123/xiaoye-plugin.git ./plugins/xiaoye-plugin/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆xiaoye插件时遇到问题"
        exit 14
        fi
        break
    ;;
    n|N)
        break
    ;;
    esac
done

# 安装atlas
while true; do
    read -p "是否安装 「 Atlas插件 」 : \"https://gitee.com/Nwflower/atlas\" (y/n):" atlas
    case "$atlas" in
    y|Y)
        echo "安装 Atlas插件"
        #clone atlas
        git clone --depth=1 https://gitee.com/Nwflower/atlas ./plugins/Atlas/
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆Atlas插件时遇到问题"
        exit 15
        fi
        #atlas imgs
        git clone --depth=1 https://gitee.com/Nwflower/genshin-atlas.git ./plugins/Atlas/Genshin-Atlas
        if [ $? != 0 ]; then
        echo "Git 从gitee克隆Atlas插件数据包时遇到问题"
        exit 16
        fi
        break
    ;;
    n|N)
        break
    ;;
    esac
done

echo " "
# 
echo "安装完成,按(y/Y)结束脚本并运行Bot."
echo "或按任意键结束脚本."
echo "若需要在后台运行YunzaiBot,你可以使用命令 apt install screen 安装 screen"
echo "并使用命令 screen -R YunzaiBot 启动窗口,在screen窗口中运行yunzaibot"
echo "更多关于screen命令,请参照 https://linuxhint.com/linux-screen-command-tutorial "
echo "(y/Y):"

read endscript
case "$endscript" in 
y|Y)
    node app
;;
*)
;;
esac
exit 0