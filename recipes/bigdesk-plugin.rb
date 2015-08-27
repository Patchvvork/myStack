# Remove the bigdesk plugin : to avoid error if already installed

execute "Remove bigdesk plugin" do
	command "/usr/share/elasticsearch/bin/plugin --remove lukas-vlcek/bigdesk"
end

# Install the bigdesk plugin

execute "Install bigdesk plugin" do
	command "/usr/share/elasticsearch/bin/plugin --install lukas-vlcek/bigdesk"
end