# Install Elasticsearch


# Import the Elasticsearch public GPG key into apt

execute "Import public key" do
	command "rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
end

# Create the Elasticsearch source list

cookbook_file "/etc/yum.repos.d/elasticsearch.repo" do
	source "elasticsearch.repo"
	mode "0644"
end

# Install Elasticsearch

execute "Install Elasticsearch" do
	command "yum -y install elasticsearch-1.4.4"
end

# Restart Elasticsearch

#execute "Restart Elasticsearch" do
#	command "systemctl restart elasticsearch"
#end

service "elasticsearch" do
	action :restart
end

# Make Elasticsearch run on boot up

#execute "Run Elasticsearch on boot up" do
#	command "systemctl enable elasticsearch"
#end

service "elasticsearch" do
	action :enable
end