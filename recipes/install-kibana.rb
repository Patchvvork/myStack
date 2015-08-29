#Go to home directory

execute "Download Kibana" do
	command "cd ~"
end

# Download Kibana 4 to home directory 

execute "Download Kibana" do
	command "wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz"
end

# Extract Kibana archive

execute "Extract Kibana" do
	command "tar xvf kibana-4.0.1-linux-x64.tar.gz"
end

# Modify Kibana yaml config file

template "kibana-4.0.1-linux-x64/config/kibana.yml" do
	source "kibana.yml.erb"
	mode "0644"
end

# Create a Kibana directory

execute "Add Kibana directory" do
	command "mkdir -p /opt/kibana"
end

# Copying the Kibana files into Kibana directory:

execute "Copy Kibana files" do
	command "cp -R /kibana-4.0.1-linux-x64/* /opt/kibana/"
end

# Make Kibana start as a service

execute "Download initi file for Kibana" do
	command "wget --output-document=\"/etc/init.d/kibana\" https://raw.githubusercontent.com/cjcotton/init-kibana/master/kibana"
end

cookbook_file "/etc/init.d/kibana" do
	source "kibana"

end

execute "Change init file mod" do
	command "chmod +x /etc/init.d/kibana"
end


# Create systemd for Kibana

#cookbook_file "/etc/systemd/system/kibana4.service" do
#	source "kibana4.service"
#	mode "0644"
#end

# Add the EPEL repository to yum

execute "Add the EPEL repository to yum" do
	command "yum -y install epel-release"
end

# Install Nginx and httpd-tools:

execute "Install Nginx and httpd-tools" do
	command "yum -y install nginx httpd-tools"
end

# Modify Kibana yaml config file

cookbook_file "/etc/nginx/nginx.conf" do
	source "nginx.conf"
	mode "0644"
end

# Add Kibana conf file

template "/etc/nginx/conf.d/kibana.conf" do
	source "kibana.conf.erb"
	mode "0644"
end


# Start Kibana

#execute "Start Kibana" do
#	command "./kibana-4.0.1-linux-x64/bin/kibana &"
#end

# Start Kibana

#execute "Start Kibana" do
#	command "/etc/init.d/kibana start"
#end

service "kibana" do
	action :start
end

# Restart Ngix

service "nginx" do
	action :stop
end

service "nginx" do
	action :start
end

service "kibana" do
	action :restart
end


