# 📁 プロジェクト構成ガイド
このドキュメントは、本プロジェクトのディレクトリ構成と各ディレクトリの役割を示すものです。
## 🏠 ルートディレクトリ
```bash
project-root/
├── README.md        # プロジェクトの概要、セットアップ手順、使用技術などを記載。
├── .env             # 環境変数を定義するファイル。開発・本番で共有する値。
├── .gitignore       # Git 管理から除外するファイル/ディレクトリを定義。
├── compose.dev.yml  # Docker による開発用のコンテナ構成。
├── .github/
├── prod/
├── umbrella/
├── doc/
```
## 🚀 GitHub Actions（CI/CD）
```bash
.github/workflows/
├── ci.yml      # 静的解析、テスト、ビルドチェック
├── cd.yml      # 本番へのデプロイフロー
```
## 🏗️ 本番環境関連
```bash
prod/
├── compose.prod.yml        # 本番用Docker構成
├── nginx/
│   └── nginx.prod.conf     # 本番用Nginx設定
├── systemd/
│   ├── certbot-renew.service # Let's Encrypt 自動更新サービス
│   └── certbot-renew.timer   # certbot 自動更新のスケジューラー
```
## 🧠 Umbrella アプリ構成
```bash
umbrella/
└── apps/
    ├── shared/      # 共通モジュール（Gettext、バリデーション、ヘルパーなど）
    ├── top/         # トップページUI（Phoenix LiveView）
    ├── inquiry/     # お仕事依頼フォーム（Ecto）
    ├── accounts/    # アカウント認証・管理（Ash Framework）
    ├── payment/     # 決済処理（Stripe連携 + Ash）
    ├── patron/      # サブスクリプション管理、契約状態（LiveView + Ash）
    ├── booth/       # 商品一覧、カート、購入機能（LiveView + Ash）
    ├── download/    # 購入済み商品のダウンロード提供
    ├── blog/        # ブログ機能（Earmark + NimblePublisher）
```
📚 ドキュメント・設計資料
```bash
doc/
├── hands-on
│   ├── setup_env_dev.md  # 開発環境構成メモ 
│   ├── setup_env_prod.md # 本番環境構成メモ 
│   ├── nginx.md          # Nginx構成メモ
│   ├── certbot.md        # Certbot構成メモ
│   ├── systemd.md        # Systemd構成メモ
├── architecture.md      # 全体設計概要
├── deployment.md        # デプロイフローと手順
├── locale.md            # 多言語対応設計
├── ash_models.md        # Ash リソース定義と関係
└── db_schema.md         # データベーススキーマ定義
```
