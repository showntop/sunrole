class Role < ActiveRecord::Base

  #include Guardian::Roleable

  #invoke_roleable_engine
  extend ActsAsTree::TreeView

  acts_as_tree

  validates :name, uniqueness: true
end
