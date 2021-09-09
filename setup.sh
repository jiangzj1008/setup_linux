# 改国内源
setup_source_mirror() {
    cat > /etc/apt/sources.list << "EOF"
    deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse 
EOF

    apt update
}

install_essential() {
    apt install -y git zsh vim build-essential
    
    sh -c "$(wget https://gitee.com/kuaibiancheng/kbc_setup/raw/master/install.ohmyz.sh -O -)"    
}

install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install -y sublime-text
}

install() {
    install_essential
    # sublime
    install_sublime
}

__main() {
    setup_source_mirror
    install
}

__main
