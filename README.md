# 🧰 Linux Development Environment Setup Script

A simple one-command setup script to bootstrap a modern development environment on **Ubuntu/Debian-based systems**.  
It installs essential developer tools — **Docker**, **Docker Compose**, **NGINX**, **Git**, **Zsh**, **eza**, and more —  
with optional **proxy support** via [proxychains](https://github.com/haad/proxychains).

---

## 🚀 Features

- 🐋 **Docker + Docker Compose** (latest stable)
- 🌐 **NGINX**, **Git**, **Zsh**, **curl**, **wget**, **zip**, **unzip**
- 📂 **eza** — a modern replacement for `ls`
- ⚙️ Optional SOCKS/HTTP proxy support via `-p` or `--proxy`
- 🧩 Automatically configures `/etc/proxychains.conf` if a proxy is provided
- 🔒 Safe and clean — no global environment pollution

---

## 🧩 Usage

### 1️⃣ Clone the repository

```bash
git clone

cd <To-Repo>

chmod +x setup.sh

sudo ./setup.sh

# SOCKS5 URL format
sudo ./setup.sh -p socks5://127.0.0.1:1080

# Space-separated format
sudo ./setup.sh -p "socks5 127.0.0.1 1080"

# Shorthand (defaults to socks5)
sudo ./setup.sh -p 127.0.0.1:1080
