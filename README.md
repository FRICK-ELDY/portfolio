## 概要
- 目的: [FRICKのポートフォリオサイト](https://frick-eldy.com)を構築する為のプロジェクト
- 主要技術:
  - `Elixir/Phoenix`: Webアプリケーションフレームワーク
  - `Ash Framework`: データベースのCRUD操作や認証/認可の管理
  - `Docker`: アプリケーションのコンテナ化
  - `Nginx`: リバースプロキシおよびSSL対応
  - `Certbot`: SSL証明書の管理
  - `Systemd`: サービスの起動管理
  - `GitHub Actions`: CI/CDの構築

## 開発環境
- OS: `Ubuntu` | `Mac` | `Windows + WSL2`
- 開発ツール:
  - `Docker Desktop`（※Ubuntu以外）
  - `VSCode`
  - `asdf`
    - `erlang` + `elixir`
- バージョン管理: `Git`,`GitHub`

## リポジトリ
- URL: https://github.com/FRICK-ELDY/portfolio
- プルリクエスト必須ルール: コミットは必ずプルリク → レビュー → マージ のフローで実行
- ghcr.ioの利用: Read and write permissions

## 本番環境
- ホスティング: [さくらインターネットVPS](https://secure.sakura.ad.jp/)
  - OS: Ubuntu 24.04
  - CPUコア: 2コア、メモリ1GB、SSD 50GB
  - 月額: 990円（初回費用1,694円）
  - IPアドレス: {IPADDRESS}
- ドメイン取得・設定: [Cloudflare](https://dash.cloudflare.com/)
  - 取得ドメイン: [frick-eldy.com](https://frick-eldy.com)
  - 年額: 10.44ドル
  - DNS設定: AレコードにIPアドレスを設定 {IPADDRESS}

## CI/CD (GitHub Actions)
- mix format (コード整形)
- mix test (テスト)
- mix dialyzer (静的解析)
- [デプロイフロー](./doc/deploy_flow.md)

# その他
- [開発環境構築](./doc/hands-on/dev_env_build.md)
- [本番環境構築](./doc/hands-on/prod_env_build.md)
- [運用・監視](./doc/operation_monitoring.md)
- [アプリケーション構造](./doc/application_structure.md)
