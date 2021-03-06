# install asdf version manager
if ! asdf | grep version; then git clone https://github.com/HashNuke/asdf.git ~/.asdf; fi
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
source ~/.bashrc

# install erlang and elixir
asdf plugin-add erlang https://github.com/HashNuke/asdf-erlang.git
asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git
erlang_version=$(awk '/erlang/ { print $2 }' .tool-versions) && asdf install erlang ${erlang_version}
elixir_version=$(awk '/elixir/ { print $2 }' .tool-versions) && asdf install elixir ${elixir_version}

# fetch dependencies
export MIX_ENV=test
mix local.hex --force
mix local.rebar --force
mix hex.info
mix deps.get
mix deps.compile
mix ecto.create
