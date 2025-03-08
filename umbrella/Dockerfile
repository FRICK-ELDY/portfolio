# ✅ 1. ビルド用のステージ（builder）
FROM elixir:1.15.0-alpine AS builder

# 必要なパッケージをインストール
RUN apk add --no-cache build-base git nodejs npm bash

# 作業ディレクトリを作成
WORKDIR /app

# Hex & Rebar のインストール
RUN mix local.hex --force && mix local.rebar --force

# 環境変数を設定（本番用）
ENV MIX_ENV=prod

# mix.exs と mix.lock を先にコピーして、依存関係をキャッシュ
COPY mix.exs mix.lock ./

# 🔥 【修正】開発環境 (`dev`) の依存関係もインストールする
RUN mix deps.get

# アプリケーションのコードをコピー
COPY . .

# アセットのビルド
RUN mix assets.deploy

# リリースの作成
RUN mix release --path /release

# ✅ 2. 実行用のステージ（runtime）
FROM elixir:1.15.0-alpine AS runtime

# 必要なランタイム依存パッケージのみインストール
RUN apk add --no-cache openssl bash

# 作業ディレクトリを設定
WORKDIR /app

# ビルドしたリリースをコピー
COPY --from=builder /release /app

# 公開ポート
EXPOSE 4000

# エントリーポイント
CMD ["bin/phoenix", "start"]