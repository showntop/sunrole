# -*- coding: utf-8 -*-
namespace :db do

  desc "create users"
  task :create_users => :environment  do
    puts 'create begin'
    ##起点
    start_no = (User.order(:id).last.try(:id) || 0) + 1
    1000.times do |i|
      User.create(login: "test#{start_no + i}", password: '1234567890a', email: "test#{start_no + i}@test.com" )
    end
    puts 'create end'
  end

  desc "create depts"
  task :create_depts => [:environment] do
    puts 'create begin'
    ##起点
    start_no = (Dept.order(:id).last.try(:id) || 0) + 1
    15.times do |i|
      root      = Dept.create("name" => "事业部门#{i}")

      20.times do |j|
        child1    = root.children.create("name" => "二级部门#{j}")
        30.times do |k|
          subchild1 = child1.children.create("name" => "三级部门#{k}")
        end
      end
    end
    puts 'create end'
  end

  desc "create roles"
  task :create_roles => [:environment] do
    puts 'create begin'
    ##起点
    start_no = (Role.order(:id).last.try(:id) || 0) + 1
    15.times do |i|
      root      = Role.create("name" => "一级角色#{i}")
      20.times do |j|
        child1    = root.children.create("name" => "二角色#{j}")
      end
    end
    puts 'create end'
  end

  desc "grant roles"
  task :grant_roles => [:environment] do
    puts 'grant begin'
    roles = Role.all
    size = roles.size
    ##起点
    start_no = (UserRole.order(:id).last.try(:id) || 0) + 1
    User.where(['id > ?', 0]).each do |user|
      role_no1 = rand(size)
      role_no2 = rand(size)
      start_role_no = role_no1 > role_no2 ? role_no2 : role_no1
      puts "#{start_role_no}---#{(role_no2 - role_no1).abs}"
      user.grant_batch! roles[start_role_no, (role_no1 - role_no2).abs]
    end
    puts 'grant end'
  end
end
