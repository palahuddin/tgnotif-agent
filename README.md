# Simple Notification Telegram Channel

Script for sending message/notification to telegram channel
*## currently build for AWS Code Build only... ##*

## Prerequisite
- Install [go](https://go.dev/doc/install)
- Create telegram 'bot' search 'BotFather'
- Copy bot 'TOKEN' from 'BotFather'
- Get chat id
```
curl https://api.telegram.org/bot<bot TOKEN>/getUpdates
```
## Script
Build Binary

```bash
go build -o tgnotif-agent main.go
```

## Usage

```bash
infrastr -c <command> -s <service>

### 'pick' install

infrastr -c <command> -s pick <service[1]> <service[2]> <service[3]> ...
```

## Help
```bash
infrastr Script, Personal Infrastructure Setup Purpose For Common Tools

Usage:
   infrastr -c <command> -s <service>

Usage multiple install 'pick' Service:
   infrastr -c  <command> -s pick <service name[1]> <service name[2]> <service name[3]> ...

Options:
   -c <command>
   -s <service name>

Available commands: 
   install  <install service>
   setup    <setup service>

Available 'install' services:
   all            Setup All Services
   golang         Installing golang 
   mc             Installing minio client 
   java           Installing java 
   nodejs         Installing nodejs 
   pm2            Installing pm2 
   docker         Installing docker 
   kubectl        Installing kubectl 
   helm           Installing Helm 
   compose        Installing docker compose 
   ansible        Installing ansible 
   terraform      Installing terraform 
   rke2           Setup RKE2 Kubernetes CLuster


Available 'setup' services:
   nginx          Deploy nginx and certbot
   harbor         Opensource container registry
   minio          Opensource object storage
   kind           Local Kubernetes Cluster Development 
```

#

