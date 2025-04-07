## HTTP-01チャレンジ

```
# プロジェクトルートで
docker compose up -d nginx  # Nginxを先に起動し、80番でリクエストを受けられる状態にする

docker compose run --rm certbot \
  certonly --webroot \
  --webroot-path=/var/www/certbot \
  --email $CERTBOT_EMAIL \
  --agree-tos \
  --no-eff-email \
  -d frick-eldy.com
```

```
docker compose restart nginx
```

## 証明書の自動更新設定
```
sudo mv /home/${{ secrets.SAKURA_USER }}/portfolio/systemd/certbot-renew.service /etc/systemd/system/certbot-renew.service
sudo mv /home/${{ secrets.SAKURA_USER }}/portfolio/systemd/certbot-renew.timer /etc/systemd/system/certbot-renew.timer
sudo systemctl enable certbot-renew.timer
sudo systemctl start certbot-renew.timer
```
