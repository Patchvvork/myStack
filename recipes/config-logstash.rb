# Modify the configuration file then restart

# Modify the Logstash config file

template "/etc/logstash/conf.d/tcp-UerEvents-ES.conf" do
	source "tcp-UerEvents-ES.conf.erb"
	mode "0644"
end

# Restart the Logstash service

service "logstash" do
	action :restart
end
