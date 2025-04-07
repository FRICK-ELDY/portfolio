# 共通ベースステージ
FROM elixir:1.18.2 as base
RUN apt-get update && apt-get install -y bash git vim sudo curl && apt-get -y upgrade
WORKDIR /app
COPY . .  
WORKDIR /app/umbrella
RUN mix local.hex --force && mix local.rebar --force
# 開発用ステージ
FROM base as dev  
RUN apt-get update && apt-get install -y inotify-tools  
RUN mix deps.get
CMD ["mix", "phx.server"]

# 本番用ビルドステージ
FROM base as prod_build
RUN mix deps.get --only prod
RUN mix assets.deploy
RUN MIX_ENV=prod mix phx.digest
RUN MIX_ENV=prod mix compile
RUN MIX_ENV=prod mix release  
# 本番用ランナーステージ（軽量イメージ）
FROM ubuntu:22.04 as prod
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libncurses5 \
    openssl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=prod_build /app/umbrella/_build/prod/rel/portfolio ./
ENV PHX_SERVER=true
ENV PORT=4000
EXPOSE 4000
CMD ["bin/portfolio", "start"]
