#!/bin/bash
# 将讨论内容备份到 GitHub
# 用法: ./backup.sh "文件名.md"
# 例: ./backup.sh "2026-03-29-预测市场讨论.md"

REPO_DIR="/root/bot_chat_chaos"
cd "$REPO_DIR" || exit 1

if [ -z "$1" ]; then
  echo "用法: $0 <讨论文件名>"
  echo "例: $0 '2026-03-29-预测市场讨论.md'"
  exit 1
fi

FILE="$1"

if [ ! -f "discussions/$FILE" ]; then
  echo "文件不存在: discussions/$FILE"
  exit 1
fi

git add "discussions/$FILE"
git commit -m "backup: $FILE"
git push origin main
echo "已推送: $FILE"
