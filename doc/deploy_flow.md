## 🚀 デプロイフロー

本プロジェクトでは、GitHub Actionsを使用して自動デプロイを実現しています。以下はデプロイフローの概要です。

### フロー概要

1. **コードの変更を`main`ブランチにプッシュ**  
   - プッシュまたはマージがトリガーとなり、CI/CDパイプラインが開始されます。

2. **Dockerイメージのビルドとプッシュ**  
   - GitHub Actionsの`build-and-push`ジョブが実行され、以下の処理を行います:
     - ソースコードをチェックアウト
     - Docker Buildxをセットアップ
     - Dockerイメージをビルドし、GitHub Container Registry (GHCR) にプッシュ

3. **本番サーバへのデプロイ**  
   - `deploy`ジョブが実行され、以下の処理を行います:
     - SSHを使用して本番サーバに接続
     - 必要なフォルダや設定ファイル（`.env`, `compose.yml`, `nginx.conf`など）をサーバにコピー
     - GHCRから最新のDockerイメージをプル
     - Docker Composeを使用してコンテナを再起動

4. **デプロイ完了**  
   - サーバ上でアプリケーションが再起動され、最新の変更が反映されます。

### 使用しているGitHub Actionsジョブ

- **`build-and-push`**  
  - Dockerイメージをビルドし、GHCRにプッシュします。
  - 使用アクション:
    - `actions/checkout@v3`
    - `docker/setup-buildx-action@v3`
    - `docker/login-action@v3`
    - `docker/build-push-action@v5`

- **`deploy`**  
  - 本番サーバに接続し、アプリケーションをデプロイします。
  - 使用アクション:
    - `actions/checkout@v3`
    - `webfactory/ssh-agent@v0.5.3`

### セキュリティと再現性

- **シークレット管理**  
  - `GITHUB_TOKEN`, `SAKURA_SSH_KEY`, `SAKURA_HOST_KEY` などの機密情報はGitHub Secretsで安全に管理しています。

- **環境の統一**  
  - `.env`ファイルや`nginx`設定、`systemd`設定を毎回再構成することで、環境の一貫性を確保しています。

- **コンテナイメージの管理**  
  - GHCR上で`latest`タグを使用して、常に最新のDockerイメージを運用しています。

### デプロイコマンド例

以下は手動でデプロイを実行する場合のコマンド例です:

```bash
# 本番サーバにSSH接続
ssh sakura_user@sakura_host

# 最新のDockerイメージをプル
docker pull ghcr.io/frick-eldy/portfolio:latest

# コンテナを再起動
cd /home/sakura_user/portfolio
docker compose down
docker compose up -d
```
