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
tgnotif-agent <arg[0]> <arg[1]>

```

## Help
```bash
tgnotif-agent <arg[0]> <arg[1]>

   <arg[0]> is codebuild project name

Available 'arg[1]' :
   start     Codebuild phase start
   prebuild  Codebuild phase prebuild
   finish    Codebuild phase postbuild
```

#

