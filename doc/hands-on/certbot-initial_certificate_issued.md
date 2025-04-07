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
