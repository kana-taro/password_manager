#!/bin/bash
echo "パスワードマネージャーへようこそ！"
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

while [ "$input" != "Exit" ]; do
    if [ "$input" = "Add Password" ]; then
        read -p "サービス名を入力してください：" service
        read -p "ユーザー名を入力してください：" user
        read -p "パスワードを入力してください：" pass
        echo "$service:$user:$pass" >> password.txt
        echo ""
        echo "パスワードの追加は成功しました。"
    elif [ "$input" = "Get Password" ]; then
        read -p "サービス名を入力してください：" servicename
        output=$(grep "^$servicename" password.txt)
        username=$(grep "^$servicename" password.txt | cut -d ":" -f 2)
        password=$(grep "^$servicename" password.txt | cut -d ":" -f 3)
            if [[ "$output" == *"$servicename"* ]]; then
                echo "サービス名：$servicename"
                echo "ユーザー名：$username"
                echo "パスワード：$password"
            else
                echo "そのサービスは登録されていません。"
            fi
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input
done
echo "Thank you!"
