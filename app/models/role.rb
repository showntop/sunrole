class Role < ActiveRecord::Base

  #include Guardian::Roleable

  #invoke_roleable_engine

  acts_as_tree
  attr_accessible :description, :name

  validate :name, uniqueness: true
end
