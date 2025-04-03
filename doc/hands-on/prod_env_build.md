## さくらインターネットVPSでUbuntu 24.04を用意
「パケットフィルターの設定」-> 「パケットフィルターを設定」ボタンを押す->Webを追加
## SSH もしくは VNC Console でログイン
### ログイン
```bash
ssh user_name@xxx-xxx-xxxxx.vs.sakura.ne.jp
```
### SSHが無ければ
```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```
### SSH鍵ペアの作成とサーバー設定
#### authorized_keysの設定
```bash
ssh-keygen -t rsa -b 4096 -C "label@example"
mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```
- リポジトリの「Settings」->「Secrets and variables」->「Actions」->「Repository secrets」
  - 秘密鍵を新たなシークレットとして登録
- user_nameはデフォルトだとrootやubuntu
#### known_hostsの設定
```bash
cat /etc/ssh/ssh_host_rsa_key.pub
```
- 
- リポジトリの「Settings」→「Secrets and variables」→「Actions」→「Repository secrets」
  - 秘密鍵を新たなシークレットとして登録

## OS 初期設定
### システムアップデート
```bash
sudo apt-get update
sudo apt-get upgrade -y
```
### タイムゾーン設定
```bash
sudo timedatectl set-timezone Asia/Tokyo
```
### ファイアウォール
```bash
# SSH
sudo ufw allow 22
# HTTP
sudo ufw allow 80
# HTTPS
sudo ufw allow 443
sudo ufw enable
```
## パッケージ更新 & Docker / docker-compose インストール
```bash
# 既存の Docker 関連パッケージの削除
sudo apt-get remove docker docker-engine docker.io containerd runc
# 依存パッケージのインストール
# ca-certificates: 
# curl: 
# gnupg: 
sudo apt-get install ca-certificates curl gnupg
# Docker の公式 GPG キーをシステムに追加し、パッケージの正当性を検証
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Docker を最新の安定バージョンで取得するため、apt にリポジトリ情報を追加
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Docker Engine, Docker CLI, containerd.io 等のインストール
# docker-ce: Docker Engine
# docker-ce-cli: Docker コマンドラインツール
# containerd.io: コンテナランタイム
# docker-buildx-plugin: buildx を使用したマルチアーキテクチャビルド等に対応
# docker-compose-plugin: Docker Compose (V2) プラグイン
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# バージョン確認
docker version
```
## Docker グループへのユーザー追加 (必要であれば)
```bash
sudo usermod -aG docker ubuntu
```
## プロジェクト配置、Dockerコンテナ起動
### ソースコード配置
```bash
cd /home/ubuntu
git clone https://github.com/FRICK-ELDY/portfolio.git
cd portfolio
```
### Docker Compose 実行
```bash
docker compose --profile prod up -d --build
```
