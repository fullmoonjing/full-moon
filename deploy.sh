#!/usr/bin/env bash
# GitHub Pages 一键部署脚本
# 使用方法：
#   1. 先在 GitHub 上创建一个空仓库（不要勾选 README/gitignore）
#   2. 把仓库地址填到下面的 REPO_URL 变量
#   3. 运行: bash deploy.sh

REPO_URL="https://github.com/你的用户名/你的仓库名.git"

set -e
cd "$(dirname "$0")"

echo "=== 初始化 Git 仓库 ==="
git init
git checkout -b main
git add -A
git commit -m "Fullmoon 工作台 - 初始部署"

echo "=== 推送到 GitHub ==="
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"
git push -u origin main

echo ""
echo "=== 推送完成！==="
echo ""
echo "接下来请手动操作："
echo "  1. 打开 GitHub 仓库页面"
echo "  2. 进入 Settings → Pages"
echo "  3. Source 选择 'GitHub Actions'"
echo "  4. 等待 Actions 运行完成后，页面顶部会显示你的网站地址"
echo ""
echo "（如果已配置 Actions 部署，推送后会自动部署，无需手动设置）"
