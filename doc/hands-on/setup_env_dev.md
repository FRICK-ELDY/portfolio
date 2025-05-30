## Docker Desktopのダウンロードとインストール
https://www.docker.com/products/docker-desktop/
## VSCordのダウンロードとインストール
https://code.visualstudio.com/download
- 必要に応じて拡張機能のインストール

## asdf のインストール 
```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc
```
## erlang + elixir のインストール
```bash
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install erlang latest
asdf global erlang latest
asdf install elixir latest
asdf global elixir latest
elixir -v
```
- バージョンを変えたい場合

## Phoenixのインストール
```bash
mix archive.install hex phx_new
```
## プロジェクトディレクトリの作成
```bash
cd {WORKING_DIRECTORY}
mkdir {PROJECT_NMANE}
cd {PROJECT_NMANE}
```
## Elixir/Phoenixのプロジェクトをumbrellaで作成
```bash
cd ./
mix new umbrella --umbrella
cd umbrella/apps
mix phx.new top --no-ecto --no-dashboard
```
※`--no-ecto`はDB周りを`Ash Framework`を用いる為、不要とする。
## nginxの設定
```bash
cd ./
mkdir nginx
cd nginx
touch nginx.dev.conf
touch nginx.prod.conf
```
※ファイルを一元化していないのは開発環境と本番環境を明確に区別する為。

※また、confファイルの条件分岐を判断できない環境がある可能性があるので安全性の為。

`./nginx/nginx.dev.conf`

https://github.com/FRICK-ELDY/portfolio/blob/main/nginx/nginx.dev.conf

`./nginx/nginx.prod.conf`

https://github.com/FRICK-ELDY/portfolio/blob/main/nginx/nginx.prod.conf

## docker composeの設定
```bash
cd ./
touch compose.yml
cd ./umbrella
touch Dockerfile
```
`./compose.yml`

https://github.com/FRICK-ELDY/portfolio/blob/main/compose.yml

`./umbrella/Dockerfile`

https://github.com/FRICK-ELDY/portfolio/blob/main/umbrella/Dockerfile
