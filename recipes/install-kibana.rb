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

template "~/kibana-4*/config/kibana.yml" do
	source "kibana.yml.erb"
	mode "0644"
end

# Create a Kibana directory

#execute "Add Kibana directory" do
#	command "mkdir -p /opt/kibana"
#end

# Copying the Kibana files into Kibana directory:

#execute "Copy Kibana files" do
#	command "sudo cp -R ~/kibana-4*/* /opt/kibana/"
#end

# Create systemd for Kibana

#cookbook_file "/etc/systemd/system/kibana4.service" do
#	source "kibana4.service"
#	mode "0644"
#end

# Start Kibana

execute "Start Kibana" do
	command "nohup ./kibana-4.0.1-linux-x64/bin/kibana &"
end

