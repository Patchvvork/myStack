# Remove the head plugin : to avoid error if already installed

execute "Remove head plugin" do
	command "/usr/share/elasticsearch/bin/plugin --remove mobz/elasticsearch-head"
end

# Install the head plugin

execute "Install head plugin" do
	command "/usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head"
end