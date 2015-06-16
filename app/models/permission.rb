class Permission < ActiveRecord::Base
  attr_accessible :action_name, :behavior, :module_name, :prep, :resourceable_id, :resourceable_type, :role_id
  #include Guardian::Ruleable
  #invoke_ruleable_engine

end
