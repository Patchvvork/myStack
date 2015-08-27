# Install Logstash


# Import the Logstash public GPG key into apt (same key as Elasticsearch, but Elasticsearch isn't installed on this instance)

execute "Import public key" do
	command "rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
end

# Create the Logstash source list

cookbook_file "/etc/yum.repos.d/logstash.repo" do
	source "logstash.repo"
	mode "0644"
end

# Install Logstash

execute "Install Logstash" do
	command "yum -y install logstash"
end

# Restart Logstash

service "logstash" do
	action :restart
end

# Make Logstash run on boot up

service "logstash" do
	action :enable
end