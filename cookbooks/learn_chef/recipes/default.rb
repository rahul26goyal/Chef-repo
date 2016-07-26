#
# Cookbook Name:: learn_chef
# Recipe:: default : to start an apache server
# Author: Rahul Goyal
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_update 'Update the apt cache Everyday Once' do
  frequency 86_400
  action :periodic
end

package 'apache2'

service 'apache2' do
  supports :status => true
  action [:enable, :start]
end

templte '/var/www/html/index.html' do
  source 'index.html.erb'
end

