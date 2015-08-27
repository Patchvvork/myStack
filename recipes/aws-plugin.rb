# Remove the AWS plugin : to avoid error if already installed

execute "Remove AWS plugin" do
	command "/usr/share/elasticsearch/bin/plugin --remove elasticsearch/elasticsearch-cloud-aws/2.4.2"
end

# Install the AWS plugin

execute "Install AWS plugin" do
	command "/usr/share/elasticsearch/bin/plugin --install elasticsearch/elasticsearch-cloud-aws/2.4.2"
end