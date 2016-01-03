# -*- coding: utf-8 -*-
namespace :db do

  desc "create users"
  task :create_users => :environment  do
    puts 'create begin'
    ##起点
    start_no = User.order(:id).last.id + 1
    1000.times do |i|
      User.create(login: "test#{start_no + i}", password: '1234567890a', email: "test#{start_no + i}@test.com" )
    end
    puts 'create end'
  end


end
