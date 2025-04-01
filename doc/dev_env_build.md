## Docker Desktopのインストール
## VSCordのインストール
## asdf のインストール 
```bash:command
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc
```
## erlang + elixir のインストール
```bash:command
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install erlang latest
asdf global erlang latest
asdf install elixir latest
asdf global elixir latest
elixir -v
```
## Phoenixのインストール、プロジェクトの作成
```bash:command
mix archive.install hex phx_new
mkdir <project_root>
cd <project_root>
mix new umbrella --umbrella
cd umbrella/apps
mix phx.new top --no-ecto --no-dashboard
```
※`--no-ecto`はDB周りを`Ash Framework`を用いる為、不要とする。

