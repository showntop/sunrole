class Role < ActiveRecord::Base

  #include Guardian::Roleable

  #invoke_roleable_engine

  acts_as_tree

  validates :name, uniqueness: true
end
