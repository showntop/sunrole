module Guardian
  module Subjectable

    def super?
      self.id == -1 || self.login == 'super'
    end

    def owned_permissions
      @owned_permissions ||= owned_roles.map {|role| role.owned_permissions }.flatten.uniq
    end

    def owned_roles
      return [Role.super_role] if self.super?
      self.granted_roles
    end

    def owned_role?(role_name, object = nil)
      role_name = normalize role_name
      !! if object.nil? && !::Acl9.config[:protect_global_roles]
        self._role_objects.find_by_name(role_name.to_s) ||
        self._role_objects.member?(get_role(role_name, nil))
      else
        role = get_role(role_name, object)
        role && self._role_objects.exists?(role.id)
      end
    end

    def owned_roles_about?(object)
      !!self._role_objects.detect(&role_selecting_lambda(object))
    end

    alias :owned_role_about? :owned_roles_about?

    def owned_roles_about(object)
      self._role_objects.select(&role_selecting_lambda(object))
    end

    def grant_roles()

    end

    alias :grant_role :grant_roles

    def revoke_roles()

    end

    alias :revoke_role :revoke_roles

    module ClassMethods
      #assoc = options[:association_name] || Acl9::config[:default_association_name]
      #role = options[:role_class_name] || Acl9::config[:default_role_class_name]
      #join_table = options[:join_table_name] || Acl9::config[:default_join_table_name] || self.table_name_prefix + [undecorated_table_name(self.to_s), undecorated_table_name(role)].sort.join("_") + self.table_name_suffix
      def invoke_subjectable_engine
        puts 'invoke_subjectable_engine'
        has_and_belongs_to_many :granted_roles, :class_name => 'Role', :join_table => 'user_roles'
      end

      ####before_destroy :has_no_roles!########清除所有角色关联

    end

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:invoke_subjectable_engine)
    end
  end
end