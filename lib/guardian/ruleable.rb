module Guardian

  #####必须得有behavior、role、action、module、resource等
  module Ruleable
     module ClassMethods
        #@@rules = self.all << self.new(true, -1, :manage, :all, :all)

        def super_rule
          @@sr ||= self.new(role_id: -1, behavior: true, action_name: :manage, resourceable_type: :all, module_name: :all)
        end

        def rule_of subject
          ##是角色
          rules.select {|rule| rule.role_id == subject.id }
        end

        def invoke_ruleable_engine
          puts 'invoke_ruleable_engine'
          belongs_to :accepted_role, :class_name => 'Role'
          belongs_to :resourceable, polymorphic: true

          #has_many :accepted_users, source: :users, through: :accepted_roles

          Machine.rules = (self.all << self.super_rule)
        end
     end

    def relevant?(action_name, resource, module_name)
      matches_action?(action_name) && matches_resource?(resource)
    end

    def matches_action? action
      action_name.to_sym == :manage || action_name == action
    end

    def matches_resource? resource
      resourceable_type.to_sym == :all || self.resourceable == resource || matches_resource_class?
    end

    def matches_resource_class?(resource)
      resourceable_type == resource
    end

     def self.included(base)
       base.extend ClassMethods
       base.send(:invoke_ruleable_engine)
     end
   end

end