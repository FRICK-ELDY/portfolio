## 概要
`Elixir/Phoenix`を使用した**FRICKのポートフォリオサイト**です。
`Elixir`以外の技術に`Docker`,`nginx`,`certbot`,`systemd`,`GitHubActions`を使っています。
DB周りは[Ash Framework](https://hexdocs.pm/ash/readme.html)を使用しています。

## 開発環境
- OS: Ubuntu | Mac | Windows + WSL2
- 開発ツール:
  - Docker Desktop（※Ubuntu以外）
  - VSCode
  - asdf
  - erlang + elixir
- バージョン管理: Git (GitHub)

## リポジトリ
- URL: https://github.com/FRICK-ELDY/portfolio
- プルリクエスト必須ルール: コミットは必ずプルリク → レビュー → マージ のフローで実行

## 本番環境
- ホスティング: [さくらインターネットVPS](https://secure.sakura.ad.jp/)
  - OS: Ubuntu 24.04
  - CPUコア: 2コア、メモリ1GB、SSD 50GB
  - 月額: 990円（初回費用1,694円）
  - IPアドレス: {SAKURA_IPADDRESS}
- ドメイン取得・設定: [Cloudflare](https://dash.cloudflare.com/)
  - 取得ドメイン: frick-eldy.com
  - 年額:10.44$
  - DNS設定: AレコードにIPアドレスを設定 {SAKURA_IPADDRESS}

## CI/CD (GitHub Actions)
- mix format (コード整形)
- mix test (テスト)
- mix dialyzer (静的解析)
- [デプロイフロー](./doc/deploy_flow.md)

# その他
- [開発環境構築](./doc/dev_env_build.md)
- [本番環境構築](./doc/prod_env_build.md)
- [運用・監視](./doc/operation_monitoring.md)
- [アプリケーション構造](./doc/application_structure.md)
