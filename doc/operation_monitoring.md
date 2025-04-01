## 運用・監視

- **ログ管理**  
  - アプリログ: Docker コンテナの標準出力 or Phoenix logs
  - Nginxログ: `/var/log/nginx/access.log`, `error.log`
- **監視・死活チェック**  
  - systemd の restart=on-failure 設定
  - 外部の監視サービス（Datadog, Zabbixなど）を導入する場合は別途手順
- **アップデート手順**  
  - git pull / docker build → docker-compose up -d によるロールアウト
