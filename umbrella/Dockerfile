FROM elixir:1.18.2 AS build
RUN apt-get update && apt-get install -y 
RUN apt-get -y upgrade
RUN apt-get -y install bash git vim sudo curl 

RUN mix local.hex --force
RUN mix local.rebar --force
  
WORKDIR /app
COPY . .

WORKDIR /app/umbrella
RUN mix deps.get --only prod
RUN MIX_ENV=prod mix compile
RUN MIX_ENV=prod mix release
  
FROM ubuntu:22.04 AS runner
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libncurses5 \
    openssl \
&& rm -rf /var/lib/apt/lists/*
  
WORKDIR /app
COPY --from=build /app/umbrella/_build/prod/rel/portfolio ./

ENV PHX_SERVER=true
ENV PORT=4000
EXPOSE 4000

CMD ["bin/portfolio", "start"]
