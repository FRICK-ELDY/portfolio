## 概要
- 目的: [FRICKのポートフォリオサイト](https://frick-eldy.com)を構築する為のプロジェクト
- 主要技術:
  - `GitHub Actions`: CI/CDの構築と自動化
  - `Systemd`: サービスの起動管理と自動化
  - `Docker`: アプリケーションのコンテナ化
    - `Nginx`: リバースプロキシおよびSSL対応
    - `Certbot`: SSL証明書の管理
    - `PostgreSQL`: データベース管理システム
    - `Elixir/Phoenix`: Webアプリケーションフレームワーク、Umbrellaプロジェクトを使用
      - `Tailwind CSS`: CSSフレームワーク
      - `Ash Framework`: データベースのCRUD操作や認証/認可の管理
      - `stripity_stripe`: Stripeの決済システム

## 開発環境
- OS: `Ubuntu` | `Mac` | `Windows + WSL2`
- 開発ツール:
  - `Docker Desktop`（※Ubuntu以外）
  - `VSCode`
  - `asdf`
    - `erlang`
    - `elixir`
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
  - パケットフィルター: TCP 80/443
- ドメイン取得・設定: [Cloudflare](https://dash.cloudflare.com/)
  - 取得ドメイン: [frick-eldy.com](https://frick-eldy.com)
  - 年額: 10.44ドル
  - DNS設定: AレコードにIPアドレスを設定 {IPADDRESS}
  - カスタム SSL/TLS: フル (厳密)
    - ブラウザ(HTTPS) ⇔ Cloudflare(HTTPS) ⇔ Nginx(HTTPS終端)

## CI/CD (GitHub Actions)
| ジョブ名     | 目的・処理内容                                    | 品質保障                                                                 |
|--------------|---------------------------------------------------|------------------------------------------------------------------------|
| `compile`    | Elixirコードのコンパイルと警告チェック            | - 警告をエラーとして扱う<br>- 依存関係の適切な取得             |
| `dialyzer`   | 型解析と型安全性の確認                             | - 型チェック<br>- 未到達コードのチェック      |
| `format`     | コードフォーマットの検査                           | - コードスタイルの統一<br>- 自動整形     |
| `credo`      | 静的解析によるコード品質チェック                   | - `--strict`モードで厳格なスタイルチェック<br>- 潜在的な問題の発見 |
| `test`       | テストコードの実行                                 | - バグ防止<br>                        |
- [デプロイフロー](./doc/deploy_flow.md)

# その他
- [開発環境構築](./doc/hands-on/dev_env_build.md)
- [本番環境構築](./doc/hands-on/prod_env_build.md)
- [運用・監視](./doc/operation_monitoring.md)
- [アプリケーション構造](./doc/application_structure.md)
