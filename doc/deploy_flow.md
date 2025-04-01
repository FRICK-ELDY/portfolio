## デプロイフロー

1. **GitHub Actions**  
   - プッシュ → Pull Request → GitHub Actions 実行
     - `mix test` によるユニットテスト
     - `mix dialyzer` による型チェック
     - `mix format --check-formatted` によるコード整形チェック
     - 成功したらデプロイ（SSH or Docker Registry等を介して）
2. **本番サーバーのDocker更新**  
   - docker-compose pull → docker-compose up -d
3. **ドメイン設定・SSL証明書 (certbot)**
   - `frick-eldy.com` の DNS 設定: Cloudflare 上で A レコードを 160.16.52.79 に向ける
   - Nginx + certbot を使用して SSL 証明書を取得 (Let’s Encrypt)
4. **サービス起動管理 (systemd)**  
   - Phoenix アプリまたは Docker を systemd で監視
   - 障害時のリスタートや通知の設定
