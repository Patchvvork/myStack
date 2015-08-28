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


