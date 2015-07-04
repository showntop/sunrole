module Guardian
  module Roleable

    module ClassMethods
      def invoke_roleable_engine
        puts 'invoke_roleable_engine'
        has_many :granted_permissions, :class_name => 'Permission', :dependent => :destroy

        has_and_belongs_to_many :granted_users, :class_name => 'User', :join_table => 'user_roles'
      end

      def super_role
        self.new(id: -1, name: 'super')
      end
    end

    def owned_permissions
      return [Permission.super_rule] if self.super?
      self.granted_permissions
    end

    def super?
      self.id == -1 || self.name == 'super'
    end

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:invoke_roleable_engine)
    end
  end
end
