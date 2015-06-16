module Guardian

  module Resourceable
    module ClassMethods
      def invoke_resourceable_engine
        puts 'invoke_resourceable_engine'
        has_many :permit_items, :as => :resourceable, :class_name => 'Permission', :dependent => :destroy

        has_many :accepted_roles, source: :roles, through: :permit_items

      end
    end

    def accepted_users
      #accepted_roles
    end

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:invoke_resourceable_engine)
    end
  end
end