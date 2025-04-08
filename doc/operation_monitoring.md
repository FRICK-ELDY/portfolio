# 運用
## 起動/再起動
サーバーのdocker composeを立ち上げる
## 更新
GitHubにて`main`ブランチにPushした時、更新する

# 監視
- **ログ管理**  
  - アプリログ: Docker コンテナの標準出力 or Phoenix logs
  - Nginxログ: `/var/log/nginx/access.log`, `error.log`
- **監視・死活チェック**  
  - systemd の restart=on-failure 設定
- **アップデート手順**  
  - git pull / docker build → docker-compose up -d によるロールアウト
