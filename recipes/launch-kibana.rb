# Restart Ngix

service "nginx" do
	action :restart
end

# Start Kibana

execute "Start Kibana" do
	command "./kibana-4.0.1-linux-x64/bin/kibana &"
end