module Guardian
  module ControllerExtensions

    def self.included(base)
      base.extend(ClassMethods)
    end

    def current_permissions

      current_user.owned_permissions

    end

    def authorize!

      resource_name = self.class.to_s.split('::')[1]
      module_name = self.class.to_s.split('::')[0]
      #puts current_user.owned_roles
      #puts current_permissions
      machine = Machine.new(current_user)
      behavior = machine.deny?(action_name, resource_name, module_name)
      #当前用户所有的permissions
      raise Guardian::AccessDenied.new(nil, action_name, resource_name) if behavior
    end

    module ClassMethods

      def invoke_the_guard(*args)
        puts 'invoke_the_guard'
        options = args.extract_options!
        self.send(:before_filter, :authorize!, options)
      end

      def omit_the_guard(*args)
        options = args.extract_options!
        self.send(:skip_before_filter, :authorize!, options)
      end
    end
    ########################
  end
end