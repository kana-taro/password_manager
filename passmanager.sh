#!/bin/bash
echo "パスワードマネージャーへようこそ！"
read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" pass
echo "$service:$user:$pass" >> password.txt
echo "Thank you!"
