# Install openjdk-8-jdk

execute "openjdk-8-jdk" do
	command "yum install java-1.8.0-openjdk -y"
end

# Install openjdk-8-jdk-devel

execute "openjdk-8-jdk" do
	command "yum install java-1.8.0-openjdk-devel -y"
end