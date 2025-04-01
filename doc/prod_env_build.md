## さくらインターネットVPSでUbuntu 24.04を用意
## SSH もしくは VNC Console でログイン
## パッケージ更新 & Docker / docker-compose インストール
```bash:command
sudo apt-get update
sudo apt-get install -y docker.io docker-compose
```
## アプリケーションデータの配置、Dockerコンテナ起動