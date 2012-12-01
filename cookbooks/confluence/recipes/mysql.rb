
script "create confluence database and user" do
  interpreter "bash"
  user "root"
  code <<-EOH
  mysql -uroot -p#{node[:mysql][:server_root_password]} -e "CREATE DATABASE confluence;"
  mysql -uroot -p#{node[:mysql][:server_root_password]} -e "CREATE USER 'confluence'@'%' IDENTIFIED BY 'confluence';"
  mysql -uroot -p#{node[:mysql][:server_root_password]} -e "GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'%';"
  mysql -uroot -p#{node[:mysql][:server_root_password]} -e "CREATE USER 'confluence'@'localhost' IDENTIFIED BY 'confluence';"
  mysql -uroot -p#{node[:mysql][:server_root_password]} -e "GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'localhost';"
  EOH
end