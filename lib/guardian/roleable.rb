module Guardian
  module Roleable

    module ClassMethods
      #assoc = options[:association_name] || Acl9::config[:default_association_name]
      #role = options[:role_class_name] || Acl9::config[:default_role_class_name]
      #join_table = options[:join_table_name] || Acl9::config[:default_join_table_name] || self.table_name_prefix + [undecorated_table_name(self.to_s), undecorated_table_name(role)].sort.join("_") + self.table_name_suffix
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