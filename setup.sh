apt update
apt install proxychains

echo "strict_chain" > /etc/proxychains.conf
echo "quiet_mode" >> /etc/proxychains.conf
echo "proxy_dns" >> /etc/proxychains.conf
echo "tcp_read_time_out 15000" >> /etc/proxychains.conf
echo "tcp_connect_time_out 8000" >> /etc/proxychains.conf
echo "[ProxyList]" >> /etc/proxychains.conf
echo "socks5  127.0.0.1 1080" >> /etc/proxychains.conf

#install need app

proxychains apt update
proxychains apt install zip unzip nginx curl wget ca-certificates git zsh gpg -y

wget -qO eza.tar.gz https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar xf eza.tar.gz --strip-components=1 -C /usr/local/bin
rm -rf eza.tar.gz
#install docker
install -m 0755 -d /etc/apt/keyrings
proxychains curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

proxychains apt update 
proxychains apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# install docker-compose
proxychains curl -SL https://github.com/docker/compose/releases/download/v2.29.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo 'alias ls="eza --color=always --git  --no-time --tree --level=1 -h"' >> .zshrc

clear
docker -v
docker-compose -v
nginx -v
zsh --version
eza --version
