#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'httpd' do
  case node[:platform]
    when 'redhat', 'centos', 'amazon'
      package_name 'httpd'
    when 'ubuntu', 'debian'
      package_name 'apache2'
    end
end

service 'apache2' do
  case node[:platform]
  when 'redhat', 'centos', 'amazon'
    service_name 'httpd'
  when 'ubuntu', 'debian'
    service_name 'apache2'
  end
  action [:enable, :start]
end

cookbook_file "/var/www/html/index.html" do
  source node["apache"]["indexfile"]
  mode "0644"
end
