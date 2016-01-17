class Dept < ActiveRecord::Base

  extend ActsAsTree::TreeView

  acts_as_tree order: "name"

end
