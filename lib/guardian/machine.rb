module Guardian
  class Machine
    @@rules = []

    def self.super_role=

    end

    def self.super_rule=

    end

    def self.rules= rules
      @@rules = rules
    end

    def self.rules
      @@rules
    end

    def rules
      self.class.rules
    end

    def initialize user
      puts 'Machine'
      @permit_rules = user.owned_permissions
    end

    def permit_rules
      @permit_rules
    end

    def allow?(action_name, resource, module_name, *extra_args)
      match = extract_matched_rules(action_name, resource, module_name).detect do |rule|
        #rule.matches_conditions?(action_name, resource, module_name, *extra_args)
        true
      end
      puts "match::#{match}"
      match.present? ? match.behavior : false
    end

    def deny?(action_name, resource, module_name, *extra_args)
      !allow?(action_name, resource, module_name, *extra_args)
    end

    def extract_matched_rules(action_name, resource, module_name)
      puts "permit_rules::#{permit_rules.class}"
      permit_rules.reverse.select do |rule|
        rule.relevant? action_name, resource, module_name
      end
    end
  end
end